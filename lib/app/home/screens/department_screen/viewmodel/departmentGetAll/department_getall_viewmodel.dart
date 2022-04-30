import 'package:login_work/export_import.dart';
import 'package:mobx/mobx.dart';
part 'department_getall_viewmodel.g.dart';

class DepartmentGetAllViewModel = _DepartmentGetAllViewModelBase
    with _$DepartmentGetAllViewModel;

abstract class _DepartmentGetAllViewModelBase extends BaseViewModelProtocol
    with Store {
  @observable
  IDepartmentService service =
      DepartmentService(dio: Dio(BaseOptions(baseUrl: departmentAllUrl)));
  @observable
  DepartmentResponseModel? departmentGetAllResponse = DepartmentResponseModel();
  @observable
  BaseResponseModel? departmentDeleteResponse = BaseResponseModel();
  @observable
  int? id;

  @action
  Future<DepartmentResponseModel?> getAllDepartment() async {
    departmentGetAllResponse = await service.getAllDepartment();
    return departmentGetAllResponse;
  }

  @override
  void setBuildContext(BuildContext buildContext) =>
      this.buildContext = buildContext;

  @action
  Future<BaseResponseModel?> deleteDepartment(int id) async {
    departmentDeleteResponse = await service.deleteDepartment(id);
    await getAllDepartment();
    Flushbar(
      message: '${departmentDeleteResponse?.message}',
      flushbarPosition: FlushbarPosition.TOP,
      duration: Duration(seconds: 1),
      borderRadius: BorderRadius.circular(2),
      backgroundColor: Colors.black.withOpacity(0.5),
    ).show(buildContext).then((value) => Navigation.ofPop());

    return departmentDeleteResponse;
  }

  @observable
  TextEditingController departmentNameController = TextEditingController();
  @observable
  GlobalKey<FormState> formKey = GlobalKey();
  @observable
  bool isLoading = false;
  @action
  String? noticeStringValidation(String? value) {
    if ((value ?? '').length < 3) {
      return dValidationText;
    } else {
      return null;
    }
  }

  @action
  void changeLoadingView() => isLoading = !isLoading;
  @action
  Future<dynamic?> updateDepartment() async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      changeLoadingView();
      final updateRequestData = await service.updateDepartment(
          DepartmentUpdateRequestModel(
              id: id, departmentName: departmentNameController.text));
      changeLoadingView();
      if (updateRequestData is BaseResponseModel) {
        Flushbar(
          message: '${updateRequestData.message}',
          flushbarPosition: FlushbarPosition.TOP,
          duration: Duration(seconds: 1),
          borderRadius: BorderRadius.circular(2),
          backgroundColor: Colors.black.withOpacity(0.5),
        ).show(buildContext).then((value) {
          Navigator.of(buildContext).pop();
          Navigator.of(buildContext).push(MaterialPageRoute(
            builder: (context) =>
                AdminPanelScreen(model: GetToken.loginResponseModel),
          ));
        });
      } else if (updateRequestData is BaseErrorResponseModel) {
        Flushbar(
          message: '${updateRequestData.message}',
          flushbarPosition: FlushbarPosition.TOP,
          duration: Duration(seconds: 1),
          borderRadius: BorderRadius.circular(2),
          backgroundColor: Colors.black.withOpacity(0.5),
        ).show(buildContext);
      }
    } else {
      print(" updateDepartment update işlemi başarısız");
    }
  }
}
