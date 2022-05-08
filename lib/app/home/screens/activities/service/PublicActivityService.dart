import 'package:dio/src/dio.dart';
import 'package:login_work/app/home/screens/activities/service/IPublicActivityService.dart';
import 'package:login_work/app/home/screens/admin_panel_screen/announcement_screen/model/notice_getall_response_model.dart';
import 'package:login_work/export_import.dart';

class PublicActivityService extends IPublicActivityService {
  PublicActivityService({required Dio dio}) : super(dio: dio);

  @override
  Future<NoticeGetAllResponseModel?> getByIdDepartmentActivity() async {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    dio.options.headers['Content-Type'] = 'application/json; charset=utf-8';
    dio.interceptors.clear();
    await GetToken.getToken();
    print(GetToken.deparmentId);
    try {
      final response = await dio.get(activityGetByIdPath,
          queryParameters: {'id': GetToken.deparmentId});
      if (response.statusCode == HttpStatus.ok) {
        return NoticeGetAllResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      if ((e as DioError).response != null) {
        return e.response?.data;
      } else {
        "Hata Gerçekleşti";
      }
    }
  }

  @override
  Future<NoticeGetAllResponseModel?> getPublicByIdDepartmentActivity() async {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    dio.options.headers['Content-Type'] = 'application/json; charset=utf-8';
    dio.interceptors.clear();
    await GetToken.getToken();
    print(GetToken.deparmentId);
    try {
      final response =
          await dio.get(activityGetByIdPath, queryParameters: {'id': 5});
      if (response.statusCode == HttpStatus.ok) {
        return NoticeGetAllResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      if ((e as DioError).response != null) {
        return e.response?.data;
      } else {
        "Hata Gerçekleşti";
      }
    }
  }
}
