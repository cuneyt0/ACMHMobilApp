import 'package:login_work/app/baseResponseModel/base_response_model.dart';
import 'package:login_work/app/home/screens/department_screen/service/DeparmentAddService.dart';
import 'package:login_work/app/home/screens/department_screen/service/IDeparmentAddService.dart';
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

  @action
  Future<DepartmentResponseModel?> getAllDepartment() async {
    departmentGetAllResponse = await service.getAllDepartment();
    return departmentGetAllResponse;
  }

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

  @override
  void setBuildContext(BuildContext buildContext) =>
      this.buildContext = buildContext;
}
