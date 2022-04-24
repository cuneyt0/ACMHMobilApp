import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:login_work/app/baseViewmodel/base_viewmodel_protocol.dart';
import 'package:login_work/app/home/screens/admin_panel_screen/announcement_screen/model/notice_getall_response_model.dart';
import 'package:login_work/app/home/screens/admin_panel_screen/announcement_screen/service/announcementService.dart';
import 'package:login_work/export_import.dart';
import 'package:mobx/mobx.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
part 'announcement_update_view_model.g.dart';

class AnnouncementUpdateViewModel = _AnnouncementUpdateViewModelBase
    with _$AnnouncementUpdateViewModel;

abstract class _AnnouncementUpdateViewModelBase extends BaseViewModelProtocol
    with Store {
  @observable
  int? id;
  @observable
  Dio dio = Dio();
  @observable
  DepartmentResponseModel? responseData = DepartmentResponseModel();
  @observable
  IAnnouncementService service = AnnouncementService(
      dio: Dio(BaseOptions(baseUrl: 'https://192.168.1.102:5001/api/Notice')));
  @observable
  Data? dropdownvalue;
  @observable
  int? selectedDepartmentId;
  @observable
  String? addedPhoto;
  @observable
  String? photo;
  @observable
  var selectedImagePath = '';
  @observable
  var selectedImageSize = '';
  @observable
  var issave = false;
  //crop code
  @observable
  var cropImagePath = '';
  @observable
  var cropImageSize = '';

  // Compress code
  @observable
  var compressImagePath = '';
  @observable
  var compressImageSize = '';
  @observable
  bool isLoading = false;
  @observable
  GlobalKey<FormState> formKey = GlobalKey();
  @observable
  TextEditingController textEditingTitleController = TextEditingController();
  @observable
  TextEditingController textEditingContentController = TextEditingController();
  @action
  void changeLoadingView() {
    isLoading = !isLoading;
  }

  @observable
  FilePickerResult? result;
  @observable
  PlatformFile? file;
  @observable
  File? newFile;
  @observable
  String? newFilePath;
  @observable
  Directory? appStorage;
  @action
  Future<void> uploadPdf() async {
    result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    file = result?.files.first;
    print('Name:${file?.name}');
    print('bytes:${file?.bytes}');
    print('size:${file?.size}');
    print('extension:${file?.extension}');
    print('path:${file?.path}');

    newFile = await saveFilePermanently(file);
    newFilePath = newFile?.path;
    print('from Path:${file?.path}');
    print('To Path:${newFile?.path}');
  }

  @action
  Future<File> saveFilePermanently(file) async {
    appStorage = await getApplicationDocumentsDirectory();
    newFile = File('${appStorage?.path}/${file.name}');
    return File(file.path!).copy(newFile!.path);
  }

  @action
  Future<void> updateNotice() async {
    if (formKey.currentState != null &&
        formKey.currentState!.validate() &&
        selectedDepartmentId != null) {
      changeLoadingView();
      final data = await service.updateNotice(NoticeRequestModel.ID(
          id: id,
          title: textEditingTitleController.text,
          content: textEditingContentController.text,
          departmentId: selectedDepartmentId,
          imagePath: addedPhoto,
          pdfPath: newFilePath));
      print(data);
      changeLoadingView();
      if (data is NoticeResponseModel) {
        print("seçilen department ID");
        print(selectedDepartmentId);
        print("Success");
      } else if (data is String) {
        ScaffoldMessenger.of(buildContext)
            .showSnackBar(SnackBar(content: Text(data)));
      } else {}
    } else {
      changeLoadingView();

      await Future.delayed(const Duration(milliseconds: 250));
      print('bla bla bla');
    }
  }

  @action
  Future<void> getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath = pickedFile.path;
      selectedImageSize = ((File(selectedImagePath)).lengthSync() / 1024 / 1024)
              .toStringAsFixed(2) +
          "Mb";
      File? cropImageFile = await ImageCropper().cropImage(
          sourcePath: selectedImagePath,
          androidUiSettings: AndroidUiSettings(
            lockAspectRatio: false,
            initAspectRatio: CropAspectRatioPreset.original,
          ),
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.ratio5x3,
            CropAspectRatioPreset.ratio7x5,
            CropAspectRatioPreset.ratio16x9,
          ],
          compressFormat: ImageCompressFormat.jpg);
      cropImagePath = cropImageFile!.path;

      cropImageSize = ((File(cropImagePath)).lengthSync() / 1024 / 1024)
              .toStringAsFixed(2) +
          " Mb";
      print(selectedImagePath.toString());
    } else {
      print("No Image Selected");
    }
  }

  @action
  Future<String> GetPhoto() async {
    if (issave != true) {
      photo = cropImagePath;

      return photo ?? 'getPhoto null';
    } else {
      return "get photo else düştü";
    }
  }

  @action
  void deleteMemoryImage() {
    cropImagePath = '';
  }

//-------------------ShowImage--------------------------
  @action
  Future<dynamic> getNetworkImage(String fileName) async {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    dio.options.headers['Content-Type'] = 'application/json; charset=utf-8';
    dio.interceptors.clear();
    try {
      Response<List<int>> response = await dio.get<List<int>>(noticeImageUrl,
          queryParameters: {'fileName': fileName},
          options: Options(responseType: ResponseType.bytes));
      if (response.statusCode == HttpStatus.ok) {
        return response.data;
      } else {
        null;
      }
    } catch (e) {
      if ((e as DioError).response != null) {
        return null;
      } else {
        "Hata Gerçekleşti";
      }
    }
  }

  @action
  Future<void> getAllDepartment() async {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    dio.options.headers['Content-Type'] = 'application/json; charset=utf-8';

    dio.interceptors.add(PrettyDioLogger());

    try {
      final response = await dio.get(departmentgetAll);
      if (response.statusCode == HttpStatus.ok) {
        responseData = DepartmentResponseModel.fromJson(response.data);
      } else {
        null;
      }
    } catch (e) {
      if ((e as DioError).response != null) {
        print(e.response?.data);
        return e.response?.data;
      } else {
        "Hata Gerçekleşti";
      }
    }
  }

  @override
  void setBuildContext(BuildContext buildContext) =>
      this.buildContext = buildContext;
}
