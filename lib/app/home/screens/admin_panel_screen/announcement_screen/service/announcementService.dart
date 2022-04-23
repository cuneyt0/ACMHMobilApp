import '../../../../../../export_import.dart';

class AnnouncementService extends IAnnouncementService {
  AnnouncementService({required Dio dio}) : super(dio: dio);

  @override
  Future<dynamic?> postNotice(NoticeRequestModel model) async {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    String loginResponseText = await CacheManager().getLoginResponse();
    LoginResponseModel loginResponseModel =
        LoginResponseModel.fromJson(jsonDecode(loginResponseText));
    print(loginResponseText);
    String token = loginResponseModel.token ?? "";
    print(token);
    dio.options.headers['Content-Type'] = 'multipart/form-data; charset=utf-8';
    dio.options.headers['Authorization'] = 'Bearer ${token}';
    print(token.toString());

    Map<String, dynamic> jsonData = model.toJson();
    if (model.imagePath != null) {
      jsonData['file'] = await MultipartFile.fromFile(model.imagePath!,
          filename: model.imagePath);
    } else {
      jsonData.remove("file");
    }
    print(jsonData);
    //var formData = FormData.fromMap(});

    dio.interceptors.add(PrettyDioLogger());
    try {
      final response =
          await dio.post(noticePath, data: FormData.fromMap(jsonData));
      if (response.statusCode == HttpStatus.ok) {
        return NoticeResponseModel.fromJson(response.data);
      } else {
        print("service null");
        return null;
      }
    } catch (e) {
      if ((e as DioError).response != null) {
        return e.response!.data;
      } else {
        return 'Hata gerçekleşti';
      }
    }
  }

  @override
  Future updateNotice(NoticeRequestModel model) async {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    String loginResponseText = await CacheManager().getLoginResponse();
    LoginResponseModel loginResponseModel =
        LoginResponseModel.fromJson(jsonDecode(loginResponseText));
    print(loginResponseText);
    String token = loginResponseModel.token ?? "";
    print(token);
    dio.options.headers['Content-Type'] = 'multipart/form-data; charset=utf-8';
    dio.options.headers['Authorization'] = 'Bearer ${token}';
    print(token.toString());

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
    //var formData = FormData.fromMap(});

    dio.interceptors.add(PrettyDioLogger());
    try {
      final response =
          await dio.patch(noticeUpdatePath, data: FormData.fromMap(jsonData));
      if (response.statusCode == HttpStatus.ok) {
        return NoticeResponseModel.fromJson(response.data);
      } else {
        print("service null");
        return null;
      }
    } catch (e) {
      if ((e as DioError).response != null) {
        return e.response!.data;
      } else {
        return 'Hata gerçekleşti';
      }
    }
  }
}
