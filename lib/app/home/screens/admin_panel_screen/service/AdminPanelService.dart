import 'package:dio/src/dio.dart';
import 'package:login_work/app/home/screens/admin_panel_screen/model/user_get_all_response.dart';
import 'package:login_work/app/home/screens/admin_panel_screen/service/IAdminPanelService.dart';
import 'package:login_work/export_import.dart';

class AdminPanelService extends IAdminPanelService {
  AdminPanelService({required Dio dio}) : super(dio: dio);

  @override
  Future<UserGetAllResponse?> getAllUser() async {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dio.options.headers['Content-Type'] = 'application/json; charset=utf-8';
    await GetToken.getToken();
    dio.options.headers['Authorization'] = 'Bearer ${GetToken.token}';
    dio.interceptors.add(PrettyDioLogger());
    try {
      final response = await dio.get(userGetAllPath);
      if (response.statusCode == HttpStatus.ok) {
        return UserGetAllResponse.fromJson(response.data);
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
  Future<UserGetAllResponse?> getByIdComputerUser() async {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dio.options.headers['Content-Type'] = 'application/json; charset=utf-8';
    await GetToken.getToken();
    dio.options.headers['Authorization'] = 'Bearer ${GetToken.token}';
    dio.interceptors.add(PrettyDioLogger());
    try {
      final response =
          await dio.get(userGetByComputerIdPath, queryParameters: {'id': 2});
      if (response.statusCode == HttpStatus.ok) {
        return UserGetAllResponse.fromJson(response.data);
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
  Future<UserGetAllResponse?> getByIdMachineUser() async {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dio.options.headers['Content-Type'] = 'application/json; charset=utf-8';
    await GetToken.getToken();
    dio.options.headers['Authorization'] = 'Bearer ${GetToken.token}';
    dio.interceptors.add(PrettyDioLogger());
    try {
      final response =
          await dio.get(userGetByMachineIdPath, queryParameters: {'id': 1});
      if (response.statusCode == HttpStatus.ok) {
        return UserGetAllResponse.fromJson(response.data);
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
