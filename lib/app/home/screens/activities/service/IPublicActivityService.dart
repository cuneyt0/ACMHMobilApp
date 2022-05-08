import 'package:login_work/export_import.dart';

abstract class IPublicActivityService {
  Dio dio;
  IPublicActivityService({required this.dio});

  final String activityGetByIdPath =
      IPublicActivityServicePath.GetByIdDepartmentActivity.rawValue;

  Future<NoticeGetAllResponseModel?> getByIdDepartmentActivity();
  Future<NoticeGetAllResponseModel?> getPublicByIdDepartmentActivity();
}

enum IPublicActivityServicePath { GetByIdDepartmentActivity }

extension IPublicActivityServicePathExtension on IPublicActivityServicePath {
  String get rawValue {
    switch (this) {
      case IPublicActivityServicePath.GetByIdDepartmentActivity:
        return '/getbydepartmentid';
    }
  }
}
