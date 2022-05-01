import 'package:login_work/export_import.dart';

class HomeService extends IHomeService {
  HomeService({required Dio dio}) : super(dio: dio);

  @override
  Future getbyidrecently() async {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    dio.options.headers['Content-Type'] = 'application/json; charset=utf-8';
    dio.interceptors.clear();
    await GetToken.getToken();
    try {
      final response = await dio.get(noticegetbyidrecentlyPath,
          queryParameters: {
            'DepartmentId1': 5,
            'DepartmentId2': GetToken.deparmentId
          });
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
