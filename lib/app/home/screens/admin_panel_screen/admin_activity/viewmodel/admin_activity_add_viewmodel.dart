
import 'package:login_work/export_import.dart';
import 'package:mobx/mobx.dart';
part 'admin_activity_add_viewmodel.g.dart';

class ActivityAddViewModel = _ActivityAddViewModelBase
    with _$ActivityAddViewModel;

abstract class _ActivityAddViewModelBase extends BaseViewModelProtocol
    with Store {
  @observable
  IDepartmentService departmentService =
      DepartmentService(dio: Dio(BaseOptions(baseUrl: departmentAllUrl)));
  @observable
  IAdminActivityService activityService =
      AdminActivityService(dio: Dio(BaseOptions(baseUrl: activityAllUrl)));
  @observable
  TextEditingController titleController = TextEditingController();
  @observable
  TextEditingController contentController = TextEditingController();
  @observable
  GlobalKey<FormState> formKey = GlobalKey();
  @observable
  Data? dropdownvalue;
  @observable
  int? selectedDepartmentId;
  @observable
  DepartmentResponseModel? departmentGetAllResponse = DepartmentResponseModel();
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
  @observable
  String? cropImagePath = '';
  @observable
  String? cropImageSize = '';
  @observable
  String? selectedImagePath = '';
  @observable
  String? selectedImageSize = '';
  @observable
  bool? issave = false;
  @observable
  String? photo;
  @observable
  String? addedPhoto;
  @observable
  String? compressImagePath = '';
  @observable
  String? compressImageSize = '';
  @observable
  bool isLoading = false;
  @observable
  int? userId;

  @override
  void setBuildContext(BuildContext buildContext) =>
      this.buildContext = buildContext;
  @action
  Future<void> uploadPdf() async {
    result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    file = result?.files.first;
    newFile = await saveFilePermanently(file);
    newFilePath = newFile?.path;
  }

  @action
  Future<File> saveFilePermanently(file) async {
    appStorage = await getApplicationDocumentsDirectory();
    newFile = File('${appStorage?.path}/${file.name}');
    return File(file.path!).copy(newFile!.path);
  }

  @action
  String? noticeStringValidation(String? value) {
    if ((value ?? '').isNotEmpty) {
      return null;
    }
    return "Boş Bırakılamaz";
  }

  @action
  Future<void> getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath = pickedFile.path;
      selectedImageSize =
          ((File(selectedImagePath ?? '')).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              "Mb";
      File? cropImageFile = await ImageCropper().cropImage(
          sourcePath: selectedImagePath ?? '',
          androidUiSettings: const AndroidUiSettings(
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

      cropImageSize = ((File(cropImagePath ?? '-')).lengthSync() / 1024 / 1024)
              .toStringAsFixed(2) +
          " Mb";
      print(selectedImagePath.toString());
    } else {}
  }

  @action
  Future<String> getPhoto() async {
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
  Future<DepartmentResponseModel?> getAllDepartment() async {
    departmentGetAllResponse = await departmentService.getAllDepartment();
    return departmentGetAllResponse;
  }

  @action
  void changeLoadingView() => isLoading = !isLoading;
  @action
  Future<void> postActivity() async {
    if (formKey.currentState != null &&
        formKey.currentState!.validate() &&
        dropdownvalue?.id != null) {
      changeLoadingView();
      final postRequestData = await activityService.postActivity(
          NoticeRequestModel(
              title: titleController.text,
              content: contentController.text,
              departmentId: selectedDepartmentId,
              imagePath: addedPhoto,
              pdfPath: newFilePath,
              userId: userId));
      changeLoadingView();
      if (postRequestData is BaseResponseModel) {
        Flushbar(
          message: '${postRequestData.message}',
          flushbarPosition: FlushbarPosition.TOP,
          duration: const Duration(seconds: 1),
          borderRadius: BorderRadius.circular(2),
          backgroundColor: Colors.black.withOpacity(0.5),
        ).show(buildContext).then((value) => Navigation.ofPop());
      } else if (postRequestData is BaseErrorResponseModel) {
        Flushbar(
          message: '${postRequestData.message}',
          flushbarPosition: FlushbarPosition.TOP,
          duration: const Duration(seconds: 1),
          borderRadius: BorderRadius.circular(2),
          backgroundColor: Colors.black.withOpacity(0.5),
        ).show(buildContext);
      }
    } else {
      Flushbar(
        message: 'Zorunlu alanlar boş geçilemez',
        flushbarPosition: FlushbarPosition.TOP,
        duration: const Duration(seconds: 1),
        borderRadius: BorderRadius.circular(2),
        backgroundColor: Colors.black.withOpacity(0.5),
      ).show(buildContext);
    }
  }
}
