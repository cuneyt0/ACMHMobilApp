import '../../../../../../export_import.dart';

abstract class IAdminActivityService {
  Dio dio;
  IAdminActivityService({required this.dio});
  final String activityAddPath = IAdminActivityServicePath.POST.rawValue;
  final String activityAllPath = IAdminActivityServicePath.GETALL.rawValue;
  final String activitydeletePath = IAdminActivityServicePath.DELETE.rawValue;
  final String activityGetByIdDepartmentPath =
      IAdminActivityServicePath.GETBYDEPARTMENTID.rawValue;
        final String activityGetByIdUserPath =
      IAdminActivityServicePath.GETBYDEPARTMENTID.rawValue;
  /*
  final String departmentUpdatePath = IDepartmentServicePath.UPDATE.rawValue;*/

  Future<dynamic?> postActivity(NoticeRequestModel model);
  Future<NoticeGetAllResponseModel?> getAllActivity();
  Future<BaseResponseModel?> deleteActivity(int? id);
  Future<DepartmentGetByIdModel?> getByIdDepartment(int? id);
   Future<UserGetByIdModel?> getByIdUser(int? id);
}

enum IAdminActivityServicePath {
  POST,
  GETALL,
  DELETE,
  UPDATE,
  GETBYDEPARTMENTID
}

extension IAdminActivityServicePathExtension on IAdminActivityServicePath {
  String get rawValue {
    switch (this) {
      case IAdminActivityServicePath.POST:
        return '/add';
      case IAdminActivityServicePath.GETALL:
        return '/getall';
      case IAdminActivityServicePath.DELETE:
        return '/delete';
      case IAdminActivityServicePath.UPDATE:
        return '/update';
      case IAdminActivityServicePath.GETBYDEPARTMENTID:
        return '/getbyid';
    }
  }
}
