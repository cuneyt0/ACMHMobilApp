
import '../../../../../../export_import.dart';

abstract class IDepartmentService {
  Dio dio;
  IDepartmentService({required this.dio});
  final String departmentAddPath = IDepartmentServicePath.POST.rawValue;
  final String departmentGetAllPath = IDepartmentServicePath.GETALL.rawValue;
  final String departmentdeletePath = IDepartmentServicePath.DELETE.rawValue;
  final String departmentUpdatePath = IDepartmentServicePath.UPDATE.rawValue;

  Future<dynamic?> postDepartment(DepartmentAddRequestModel model);
  Future<dynamic?> getAllDepartment();
  Future<dynamic?> deleteDepartment(int id);
  Future<dynamic?> updateDepartment(DepartmentUpdateRequestModel model);
}

enum IDepartmentServicePath { POST, GETALL, DELETE, UPDATE }

extension IDepartmentServicePathExtension on IDepartmentServicePath {
  String get rawValue {
    switch (this) {
      case IDepartmentServicePath.POST:
        return '/add';
      case IDepartmentServicePath.GETALL:
        return '/getall';
      case IDepartmentServicePath.DELETE:
        return '/delete';
      case IDepartmentServicePath.UPDATE:
        return '/update';
    }
  }
}
