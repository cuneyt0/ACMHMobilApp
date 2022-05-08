import 'package:login_work/app/home/screens/admin_panel_screen/model/user_get_all_response.dart';

import '../../../../../../export_import.dart';

abstract class IAdminPanelService {
  Dio dio;
  IAdminPanelService({required this.dio});

  final String userGetAllPath = IAdminPanelServicePath.GETALL.rawValue;
  final String userGetByComputerIdPath =
      IAdminPanelServicePath.GETBYDEPARTMENTID.rawValue;
        final String userGetByMachineIdPath =
      IAdminPanelServicePath.GETBYDEPARTMENTID.rawValue;

  Future<UserGetAllResponse?> getByIdComputerUser();
  Future<UserGetAllResponse?> getByIdMachineUser();
  Future<UserGetAllResponse?> getAllUser();
}

enum IAdminPanelServicePath { GETALL, GETBYDEPARTMENTID }

extension IAdminPanelServicePathExtension on IAdminPanelServicePath {
  String get rawValue {
    switch (this) {
      case IAdminPanelServicePath.GETALL:
        return '/getall';
      case IAdminPanelServicePath.GETBYDEPARTMENTID:
        return '/getbydepartmentid';
    }
  }
}
