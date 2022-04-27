import 'package:login_work/app/home/screens/department_screen/service/DeparmentAddService.dart';
import 'package:login_work/app/home/screens/department_screen/service/IDeparmentAddService.dart';
import 'package:login_work/export_import.dart';
import 'package:mobx/mobx.dart';
part 'department_getall_viewmodel.g.dart';

class DepartmentGetAllViewModel = _DepartmentGetAllViewModelBase
    with _$DepartmentGetAllViewModel;

abstract class _DepartmentGetAllViewModelBase with Store {
  @observable
  IDepartmentService service =
      DepartmentService(dio: Dio(BaseOptions(baseUrl: departmentAdd)));
  @observable
  DepartmentResponseModel? departmentGetAllResponse = DepartmentResponseModel();

  @action
  Future<DepartmentResponseModel?> getAllDepartment() async {
    departmentGetAllResponse = await service.getAllDepartment();
    return departmentGetAllResponse;
  }
}
