import '../../../../../../export_import.dart';

abstract class IAdminCafeteriaService {
  Dio dio;
  IAdminCafeteriaService({required this.dio});
  final String cafeteriaAddPath = IAdminCafeteriaServicePath.POST.rawValue;
  final String cafeteriaAllPath = IAdminCafeteriaServicePath.GETALL.rawValue;
  final String cafeteriaDeletePath = IAdminCafeteriaServicePath.DELETE.rawValue;
  final String cafeteriaGetByIdDepartmentPath =
      IAdminCafeteriaServicePath.GETBYDEPARTMENTID.rawValue;
  final String cafeteriaGetByIdUserPath =
      IAdminCafeteriaServicePath.GETBYDEPARTMENTID.rawValue;
  final String cafeteriaUpdatePath = IAdminCafeteriaServicePath.UPDATE.rawValue;

  Future<dynamic?> postCafeteria(NoticeRequestModel model);
  Future<NoticeGetAllResponseModel?> getAllCafeteria();
  Future<BaseResponseModel?> deleteCafeteria(int? id);
  Future<DepartmentGetByIdModel?> getByIdDepartment(int? id);
  Future<UserGetByIdModel?> getByIdUser(int? id);
  Future<dynamic?> updateCafeteria(NoticeRequestModel model);
}

enum IAdminCafeteriaServicePath {
  POST,
  GETALL,
  DELETE,
  UPDATE,
  GETBYDEPARTMENTID
}

extension IAdminCafeteriaServicePathExtension on IAdminCafeteriaServicePath {
  String get rawValue {
    switch (this) {
      case IAdminCafeteriaServicePath.POST:
        return '/add';
      case IAdminCafeteriaServicePath.GETALL:
        return '/getall';
      case IAdminCafeteriaServicePath.DELETE:
        return '/delete';
      case IAdminCafeteriaServicePath.UPDATE:
        return '/update';
      case IAdminCafeteriaServicePath.GETBYDEPARTMENTID:
        return '/getbyid';
    }
  }
}
