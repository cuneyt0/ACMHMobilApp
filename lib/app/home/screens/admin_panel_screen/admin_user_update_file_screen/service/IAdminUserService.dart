import '../../../../../../export_import.dart';

abstract class IAdminUserService {
  Dio dio;
  IAdminUserService({required this.dio});
  final String userExcelAddPath = IAdminUserServicePath.POST.rawValue;

  Future<dynamic?> postUserExcel(dynamic? excelFile);
}

enum IAdminUserServicePath {
  POST,
}

extension IAdminUserServicePathExtension on IAdminUserServicePath {
  String get rawValue {
    switch (this) {
      case IAdminUserServicePath.POST:
        return '/excel-upload';
    }
  }
}
