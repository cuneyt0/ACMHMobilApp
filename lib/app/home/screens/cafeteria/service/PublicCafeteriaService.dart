
import 'package:login_work/export_import.dart';

class PublicCafeteriaService extends IPublicCafeteriaService{
  PublicCafeteriaService({required Dio dio}) : super(dio: dio);

  @override
  Future<NoticeGetAllResponseModel?> getCafeteriRecently()async {
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
      final response = await dio.get(cafeteriaPath);
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