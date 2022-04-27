import 'package:login_work/app/baseResponseModel/base_error_response_model.dart';
import 'package:login_work/app/baseResponseModel/base_response_model.dart';
import 'package:login_work/app/home/screens/department_screen/model/department_add_response_model.dart';
import 'package:login_work/app/home/screens/department_screen/service/DeparmentAddService.dart';
import 'package:login_work/app/home/screens/department_screen/service/IDeparmentAddService.dart';
import 'package:login_work/export_import.dart';
import 'package:mobx/mobx.dart';
part 'deparment_add_viewmodel.g.dart';

class DepartmentAddViewModel = _DepartmentAddViewModelBase
    with _$DepartmentAddViewModel;

abstract class _DepartmentAddViewModelBase extends BaseViewModelProtocol
    with Store {
  @observable
  IDepartmentService service =
      DepartmentService(dio: Dio(BaseOptions(baseUrl: departmentAllUrl)));

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

  @override
  void setBuildContext(BuildContext buildContext) =>
      this.buildContext = buildContext;
  @action
  void changeLoadingView() => isLoading = !isLoading;

  @action
  Future<dynamic?> postDepartment() async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      changeLoadingView();
      final postRequestData = await service.postDepartment(
          DepartmentAddRequestModel(
              departmentName: departmentNameController.text));
      changeLoadingView();
      if (postRequestData is BaseResponseModel) {
        Flushbar(
          message: '${postRequestData.message}',
          flushbarPosition: FlushbarPosition.TOP,
          duration: Duration(seconds: 1),
          borderRadius: BorderRadius.circular(2),
          backgroundColor: Colors.black.withOpacity(0.5),
        ).show(buildContext).then((value) => Navigation.ofPop());
      } else if (postRequestData is BaseErrorResponseModel) {
        Flushbar(
          message: '${postRequestData.message}',
          flushbarPosition: FlushbarPosition.TOP,
          duration: Duration(seconds: 1),
          borderRadius: BorderRadius.circular(2),
          backgroundColor: Colors.black.withOpacity(0.5),
        ).show(buildContext);
      }
    } else {
      print(" DepartmentAdd post işleminde validasyonlar karşılanmadı");
    }
  }
}
