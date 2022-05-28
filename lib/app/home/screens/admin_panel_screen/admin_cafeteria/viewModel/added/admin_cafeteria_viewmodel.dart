import 'package:login_work/export_import.dart';
import 'package:mobx/mobx.dart';
part 'admin_cafeteria_viewmodel.g.dart';

class AdminCafeteriaAddViewModel = _AdminCafeteriaAddViewModelBase
    with _$AdminCafeteriaAddViewModel;

abstract class _AdminCafeteriaAddViewModelBase extends BaseViewModelProtocol
    with Store {
  @observable
  IAdminCafeteriaService cafeteriaService =
      AdminCafeteriaService(dio: Dio(BaseOptions(baseUrl: cafeteriaAllUrl)));
  @observable
  IFCMService fmcService =
      FCMService(dio: Dio(BaseOptions(baseUrl: 'https://fcm.googleapis.com')));
  @observable
  TextEditingController titleController = TextEditingController();
  @observable
  bool isLoading = false;
  @observable
  String? newFilePath;
  @observable
  int? userId;
  @observable
  FilePickerResult? result;
  @observable
  PlatformFile? file;
  @observable
  File? newFile;
  @observable
  Directory? appStorage;
  @observable
  FirebaseMessageNotificationModel? notification =
      FirebaseMessageNotificationModel();

  @observable
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  void setBuildContext(BuildContext buildContext) =>
      this.buildContext = buildContext;

  @action
  String? noticeStringValidation(String? value) {
    if ((value ?? '').isNotEmpty) {
      return null;
    }
    return "Boş Bırakılamaz";
  }

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
  void changeLoadingView() => isLoading = !isLoading;

  @action
  Future<void> postActivity() async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      changeLoadingView();
      final postRequestData = await cafeteriaService.postCafeteria(
          NoticeRequestModel(
              title: titleController.text,
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
        await sendNotificationMessage();
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

  @action
  Future<void> sendNotificationMessage() async {
    await GetToken.getToken();
    notification?.title = titleController.text;
    await fmcService.sendNotificationMessage(FirebaseMessageModel(
        to: GetToken.messageToken, notification: notification));
  }
}
