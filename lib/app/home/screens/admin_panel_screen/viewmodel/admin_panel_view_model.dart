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
  @observable
  double allStudentValue = 0.0;
  @observable
  double computerStudentValue = 0.0;
  @observable
  double machineStudentValue = 0.0;

  @observable
  AdminCafeteriaGetAllViewModel cafeteriaViewModel =
      AdminCafeteriaGetAllViewModel();
  @observable
  AdminActivityAllViewModel activityViewModel = AdminActivityAllViewModel();
  @observable
  HomeViewModel noticeViewModel = HomeViewModel();

  @observable
  List<Color> colorList = [
    Colors.amber,
    const Color(0xff3EE094),
    const Color(0xff3398F6),
  ];
  Future<UserGetAllResponse?> getAllUser() async {
    userGetAllResponse = await service.getAllUser();
    allStudentValue = userGetAllResponse?.data?.length.toDouble() ?? 0.0;
    computerStudentValue = userGetAllResponse?.data
            ?.where((element) => element.departmentId == 2)
            .length
            .toDouble() ??
        0.0;
    machineStudentValue = userGetAllResponse?.data
            ?.where((element) => element.departmentId == 1)
            .length
            .toDouble() ??
        0.0;
    print(computerStudentValue);
    print(machineStudentValue);
    await cafeteriaViewModel.getAllCafeteria();
    await activityViewModel.getAllActivity();
    await noticeViewModel.getAllNotice();
    return userGetAllResponse;
  }

  /* Future<UserGetAllResponse?> getByIdComputerUser() async {
    userComputerResponse = await service.getByIdComputerUser();
    computerStudentValue = userComputerResponse?.data?.length.toDouble() ?? 0.0;
    return userComputerResponse;
  }

  Future<UserGetAllResponse?> getByIdMachineUser() async {
    userMachineResponse = await service.getByIdMachineUser();
    machineStudentValue = userMachineResponse?.data?.length.toDouble() ?? 0.0;
    return userMachineResponse;
  }*/
}
