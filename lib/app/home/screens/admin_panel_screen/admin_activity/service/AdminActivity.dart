import 'package:login_work/export_import.dart';

class AdminActivityService extends IAdminActivityService {
  AdminActivityService({required Dio dio}) : super(dio: dio);
  @override
  Future postActivity(NoticeRequestModel model) async {
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
    if (model.imagePath != null) {
      jsonData['file'] = await MultipartFile.fromFile(model.imagePath!,
          filename: model.imagePath);
    } else {
      jsonData.remove("file");
    }
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
          await dio.post(activityAddPath, data: FormData.fromMap(jsonData));
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
}
