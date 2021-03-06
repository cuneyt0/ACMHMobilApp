import '../../../../../../export_import.dart';

class PublicAnnoucementService extends IPublicAnnoucementService {
  PublicAnnoucementService({required Dio dio}) : super(dio: dio);

  @override
  Future getByIdDepartmentAnnoucement() async {
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
      final response = await dio.get(departmentGetByIdPath,
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
  Future getPublicByIdDepartmentAnnoucement() async {
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
          await dio.get(departmentGetByIdPath, queryParameters: {'id': 5});
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
  Future getByIdDepartment(int? id) async {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    dio.options.headers['Content-Type'] = 'application/json; charset=utf-8';
    await GetToken.getToken();
    dio.options.headers['Authorization'] = 'Bearer ${GetToken.token}';
    dio.interceptors.clear();

    try {
      final response =
          await dio.get(getByIdDepartmentPath, queryParameters: {'id': id});
      if (response.statusCode == HttpStatus.ok) {
        return DepartmentGetByIdModel.fromJson(response.data);
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
  Future getByIdUser(int id) async {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    dio.options.headers['Content-Type'] = 'application/json; charset=utf-8';
    await GetToken.getToken();
    dio.options.headers['Authorization'] = 'Bearer ${GetToken.token}';
    dio.interceptors.clear();
    try {
      final response =
          await dio.get(getByIdUserUrl, queryParameters: {'id': id});
      if (response.statusCode == HttpStatus.ok) {
        return UserGetByIdModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      if ((e as DioError).response != null) {
        print(e.response?.data);
        return e.response?.data;
      } else {
        "Hata Gerçekleşti";
      }
    }
  }
}

//AllUserUrl
/*
@action
  Future<UserGetByIdModel?> getByIdUser(int? id) async {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    dio.options.headers['Content-Type'] = 'application/json; charset=utf-8';
    await GetToken.getToken();
    dio.options.headers['Authorization'] = 'Bearer ${GetToken.token}';
    dio.interceptors.clear();
    try {
      final response =
          await dio.get(getByIdUserUrl, queryParameters: {'id': id});
      if (response.statusCode == HttpStatus.ok) {
        userGetByIdModel = UserGetByIdModel.fromJson(response.data);
        return userGetByIdModel;
      } else {
        return null;
      }
    } catch (e) {
      if ((e as DioError).response != null) {
        print(e.response?.data);
        return e.response?.data;
      } else {
        "Hata Gerçekleşti";
      }
    }
  }


 */