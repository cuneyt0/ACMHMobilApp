import '../../../../../../export_import.dart';

abstract class IAdminActivityService {
  Dio dio;
  IAdminActivityService({required this.dio});
  final String activityAddPath = IAdminActivityServicePath.POST.rawValue;
  /*final String departmentGetAllPath = IDepartmentServicePath.GETALL.rawValue;
  final String departmentdeletePath = IDepartmentServicePath.DELETE.rawValue;
  final String departmentUpdatePath = IDepartmentServicePath.UPDATE.rawValue;*/

  Future<dynamic?> postActivity(NoticeRequestModel model);
}

enum IAdminActivityServicePath { POST, GETALL, DELETE, UPDATE }

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
    }
  }
}