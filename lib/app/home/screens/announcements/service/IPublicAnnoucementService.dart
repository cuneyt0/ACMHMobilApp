import 'package:login_work/export_import.dart';

abstract class IPublicAnnoucementService {
  Dio dio;
  IPublicAnnoucementService({required this.dio});

  final String departmentGetByIdPath =
      IPublicAnnoucementServicePath.GetByIdDepartmentAnnoucement.rawValue;
  final String getByIdDepartmentPath =
      IPublicAnnoucementServicePath.GETBYIDDEPARTMENT.rawValue;
  final String getByIdUserPath =
      IPublicAnnoucementServicePath.GETBYIDDEPARTMENT.rawValue;

  Future<dynamic?> getByIdDepartmentAnnoucement();
  Future<dynamic?> getPublicByIdDepartmentAnnoucement();
  Future<dynamic?> getByIdDepartment();
  Future<dynamic?> getByIdUser(int id);
}

enum IPublicAnnoucementServicePath {
  GetByIdDepartmentAnnoucement,
  GETBYIDDEPARTMENT,
}

extension IPublicAnnoucementServicePathExtension
    on IPublicAnnoucementServicePath {
  String get rawValue {
    switch (this) {
      case IPublicAnnoucementServicePath.GetByIdDepartmentAnnoucement:
        return '/getbydepartmentid';
      case IPublicAnnoucementServicePath.GETBYIDDEPARTMENT:
        return '/getbyid';
    }
  }
}
