import 'package:login_work/app/home/screens/admin_panel_screen/admin_user_update_file_screen/service/AdminUserService.dart';
import 'package:login_work/app/home/screens/admin_panel_screen/admin_user_update_file_screen/service/IAdminUserService.dart';
import 'package:login_work/export_import.dart';
import 'package:mobx/mobx.dart';
part 'admin_user_update_viewmodel.g.dart';

class AdminUserUpdateViewModel = _AdminUserUpdateViewModelBase
    with _$AdminUserUpdateViewModel;

abstract class _AdminUserUpdateViewModelBase extends BaseViewModelProtocol
    with Store {
  @observable
  IAdminUserService cafeteriaService =
      AdminUserService(dio: Dio(BaseOptions(baseUrl: userexcelUrl)));
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
  Future<void> postExcel() async {
    await cafeteriaService.postUserExcel(newFilePath);
    Flushbar(
      message: 'Ekleme Başarılı',
      flushbarPosition: FlushbarPosition.TOP,
      duration: const Duration(seconds: 1),
      borderRadius: BorderRadius.circular(2),
      backgroundColor: Colors.black.withOpacity(0.5),
    ).show(buildContext).then((value) => Navigation.ofPop());
  }
}
