import 'package:login_work/app/home/screens/department_screen/model/department_add_response_model.dart';

import '../../../../../../export_import.dart';

abstract class IDepartmentService {
  Dio dio;
  IDepartmentService({required this.dio});
  final String departmentAddPath = IDepartmentServicePath.POST.rawValue;

  Future<dynamic?> postDepartment(DepartmentAddRequestModel model);
}

enum IDepartmentServicePath { POST }

extension IDepartmentServicePathExtension on IDepartmentServicePath {
  String get rawValue {
    switch (this) {
      case IDepartmentServicePath.POST:
        return '/add';
    }
  }
}
