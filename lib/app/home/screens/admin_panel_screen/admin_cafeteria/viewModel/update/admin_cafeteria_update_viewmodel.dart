import 'package:login_work/app/baseViewmodel/base_viewmodel_protocol.dart';

import 'package:login_work/export_import.dart';
import 'package:mobx/mobx.dart';
part 'admin_cafeteria_update_viewmodel.g.dart';

class UpdateCafeteriaViewModel = _UpdateCafeteriaViewModelBase
    with _$UpdateCafeteriaViewModel;

abstract class _UpdateCafeteriaViewModelBase extends BaseViewModelProtocol
    with Store {
  @override
  void setBuildContext(BuildContext buildContext) =>
      this.buildContext = buildContext;
  @observable
  TextEditingController titleController = TextEditingController();
  @observable
  GlobalKey<FormState> formKey = GlobalKey();
  @observable
  bool isLoading = false;
  @observable
  int? id;
  @observable
  int? userId;
  @observable
  String? newFilePath;
  @observable
  Directory? appStorage;
  @observable
  FilePickerResult? result;
  @observable
  PlatformFile? file;
  @observable
  File? newFile;
  @observable
  AdminPanelViewModel? adminPanelViewModel = AdminPanelViewModel();
  @observable
  IAdminCafeteriaService cafeteriaService =
      AdminCafeteriaService(dio: Dio(BaseOptions(baseUrl: cafeteriaAllUrl)));
  @action
  void changeLoadingView() => isLoading = !isLoading;
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
  Future<void> updateActivity() async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      changeLoadingView();
      final postRequestData = await cafeteriaService.updateCafeteria(
          NoticeRequestModel.ID(
              id: id,
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
        ).show(buildContext).then((value) {
          //Navigator.of(buildContext).pop();
          Navigator.of(buildContext).push(MaterialPageRoute(
            builder: (context) => AdminPanelScreen(
                model: GetToken.loginResponseModel,
                viewModel: adminPanelViewModel),
          ));
        });
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
