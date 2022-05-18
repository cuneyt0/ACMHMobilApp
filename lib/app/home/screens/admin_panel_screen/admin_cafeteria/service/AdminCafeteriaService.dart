import 'package:dio/src/dio.dart';
import 'package:login_work/app/home/model/department_getbyid_response_model.dart';
import 'package:login_work/app/baseResponseModel/base_response_model.dart';
import 'package:login_work/app/home/screens/admin_panel_screen/admin_cafeteria/service/IAdminCafeteriaService.dart';
import 'package:login_work/app/home/screens/admin_panel_screen/announcement_screen/model/user_getbyid_response_model.dart';
import 'package:login_work/app/home/screens/admin_panel_screen/announcement_screen/model/notice_request_model.dart';
import 'package:login_work/app/home/screens/admin_panel_screen/announcement_screen/model/notice_getall_response_model.dart';
import 'package:login_work/export_import.dart';

class AdminCafeteriaService extends IAdminCafeteriaService {
  AdminCafeteriaService({required Dio dio}) : super(dio: dio);

  @override
  Future<BaseResponseModel?> deleteCafeteria(int? id) {
    // TODO: implement deleteCafeteria
    throw UnimplementedError();
  }

  @override
  Future<NoticeGetAllResponseModel?> getAllCafeteria() {
    // TODO: implement getAllCafeteria
    throw UnimplementedError();
  }

  @override
  Future<DepartmentGetByIdModel?> getByIdDepartment(int? id) {
    // TODO: implement getByIdDepartment
    throw UnimplementedError();
  }

  @override
  Future<UserGetByIdModel?> getByIdUser(int? id) {
    // TODO: implement getByIdUser
    throw UnimplementedError();
  }

  @override
  Future postCafeteria(NoticeRequestModel model) async {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    await GetToken.getToken();
    dio.options.headers['Content-Type'] = 'multipart/form-data; charset=utf-8';
    dio.options.headers['Authorization'] = 'Bearer ${GetToken.token}';
    Map<String, dynamic> jsonData = model.toJson();
    if (model.pdfPath != null) {
      jsonData['pdfFile'] =
          await MultipartFile.fromFile(model.pdfPath!, filename: model.pdfPath);
    } else {
      jsonData.remove("pdfFile");
    }
    print(jsonData);
    dio.interceptors.add(PrettyDioLogger());
    try {
      final response =
          await dio.post(cafeteriaAddPath, data: FormData.fromMap(jsonData));
      if (response.statusCode == HttpStatus.ok) {
        return BaseResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      if ((e as DioError).response != null) {
        return BaseErrorResponseModel.fromJson(e.response?.data);
      } else {
        return "Hata Gerçekleşti";
      }
    }
  }

  @override
  Future updateCafeteria(NoticeRequestModel model) {
    // TODO: implement updateCafeteria
    throw UnimplementedError();
  }
}
