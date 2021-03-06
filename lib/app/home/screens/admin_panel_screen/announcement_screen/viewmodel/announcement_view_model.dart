import 'package:login_work/export_import.dart';
import 'package:mobx/mobx.dart';
part 'announcement_view_model.g.dart';

class AnnouncementViewModel = _AnnouncementViewModelBase
    with _$AnnouncementViewModel;

abstract class _AnnouncementViewModelBase with Store {
  @observable
  DepartmentResponseModel? responseData = DepartmentResponseModel();

  @observable
  IAnnouncementService service =
      AnnouncementService(dio: Dio(BaseOptions(baseUrl: noticeAdd)));

  @observable
  Dio dio = Dio();
  @observable
  Data? dropdownvalue;
  @observable
  var selectedImagePath = '';
  @observable
  var selectedImageSize = '';
  @observable
  var issave = false;
  @observable
  String? photo;
  @observable
  String? addedPhoto;
  @observable
  int? selectedDepartmentId;
  @observable
  int? userId;
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
  IFCMService fmcService =
      FCMService(dio: Dio(BaseOptions(baseUrl: 'https://fcm.googleapis.com')));
  @observable
  FirebaseMessageNotificationModel? notification =
      FirebaseMessageNotificationModel();


  @observable
  TextEditingController titleController = TextEditingController();
  @observable
  TextEditingController contentController = TextEditingController();
  @observable
  GlobalKey<FormState> formKey = GlobalKey();
  @observable
  @action
  String? noticeStringValidation(String? value) {
    if ((value ?? '').length > 0) {
      return null;
    }
    return "Boş Bırakılamaz";
  }

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

  @action
  Future<void> postNotice() async {
    if (formKey.currentState != null &&
        formKey.currentState!.validate() &&
        dropdownvalue?.id != null) {
      changeLoadingView();
      final data = await service.postNotice(NoticeRequestModel(
          title: titleController.text,
          content: contentController.text,
          departmentId: selectedDepartmentId,
          imagePath: addedPhoto,
          pdfPath: newFilePath,
          userId: userId));

      if (data is NoticeResponseModel) {
        print(" Notice post işlemi Başarılı");
        if (selectedDepartmentId == GetToken.deparmentId) {
          await sendNotificationMessage();
        } else if (selectedDepartmentId == 5) {
          await sendNotificationMessage();
        }
      } else {
        print(" Notice post işlemi Başarısız");
      }
    } else {
      print(" Notice post işleminde validasyonlar karşılanmadı");
    }
  }
    @action
  Future<void> sendNotificationMessage() async {
    await GetToken.getToken();
    notification?.title = titleController.text;
    await fmcService.sendNotificationMessage(FirebaseMessageModel(
        to: GetToken.messageToken, notification: notification));
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
    await GetToken.getToken();
    dio.options.headers['Authorization'] = 'Bearer ${GetToken.token}';
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
        return e.response?.data;
      } else {
        "Hata Gerçekleşti";
      }
    }
  }
}
