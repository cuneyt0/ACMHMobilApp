import 'package:login_work/export_import.dart';

class LoginService extends ILoginService {
  LoginService(Dio dio) : super(dio);

  @override
  Future<dynamic?> postUserLogin(LoginRequestModel model) async {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dio.options.headers['Content-Type'] = 'application/json; charset=utf-8';
    dio.interceptors.add(PrettyDioLogger());
    try {
      final response = await dio.post(
        loginPath,
        data: model,
      );
      if (response.statusCode == HttpStatus.ok) {
        return LoginResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      if ((e as DioError).response != null) {
        return e.response!.data;
      } else {
        return "Hata Gerçekleşti";
      }
    }
  }
}
