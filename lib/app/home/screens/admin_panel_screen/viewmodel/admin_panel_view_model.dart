import 'package:login_work/app/home/screens/admin_panel_screen/model/user_get_all_response.dart';
import 'package:login_work/app/home/screens/admin_panel_screen/service/AdminPanelService.dart';
import 'package:login_work/app/home/screens/admin_panel_screen/service/IAdminPanelService.dart';
import 'package:login_work/export_import.dart';
import 'package:mobx/mobx.dart';
part 'admin_panel_view_model.g.dart';

class AdminPanelViewModel = _AdminPanelViewModelBase with _$AdminPanelViewModel;

abstract class _AdminPanelViewModelBase with Store {
  @observable
  IAdminPanelService service =
      AdminPanelService(dio: Dio(BaseOptions(baseUrl: allUserUrl)));
  @observable
  UserGetAllResponse? userGetAllResponse = UserGetAllResponse();
  @observable
  UserGetAllResponse? userComputerResponse = UserGetAllResponse();
  @observable
  UserGetAllResponse? userMachineResponse = UserGetAllResponse();
  Future<UserGetAllResponse?> getAllUser() async {
    return userGetAllResponse = await service.getAllUser();
  }

  Future<UserGetAllResponse?> getByIdComputerUser() async {
    return userComputerResponse = await service.getByIdComputerUser();
  }

  Future<UserGetAllResponse?> getByIdMachineUser() async {
    return userMachineResponse = await service.getByIdMachineUser();
  }
}
