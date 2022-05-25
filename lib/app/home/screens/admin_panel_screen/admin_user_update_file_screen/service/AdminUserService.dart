import 'package:dio/src/dio.dart';
import 'package:login_work/app/home/screens/admin_panel_screen/admin_user_update_file_screen/service/IAdminUserService.dart';
import 'package:login_work/export_import.dart';

class AdminUserService extends IAdminUserService {
  AdminUserService({required Dio dio}) : super(dio: dio);

  @override
  Future postUserExcel(dynamic? excelFile) async {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    await GetToken.getToken();
    dio.options.headers['Content-Type'] = 'multipart/form-data; charset=utf-8';
    dio.options.headers['Authorization'] = 'Bearer ${GetToken.token}';
    var formData = FormData.fromMap({
      'excelFile': await MultipartFile.fromFile(excelFile, filename: excelFile),
    });

    dio.interceptors.add(PrettyDioLogger());
    try {
      final response = await dio.post(userExcelAddPath, data: formData);
      if (response.statusCode == HttpStatus.ok) {
        return 'Ekleme başarılı';
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
}
