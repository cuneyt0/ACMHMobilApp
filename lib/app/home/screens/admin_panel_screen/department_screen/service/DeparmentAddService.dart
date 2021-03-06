


import 'package:login_work/export_import.dart';

class DepartmentService extends IDepartmentService {
  DepartmentService({required Dio dio}) : super(dio: dio);
  @override
  Future postDepartment(DepartmentAddRequestModel model) async {
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
      final response = await dio.post(
        departmentAddPath,
        data: model,
      );
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
  Future<dynamic> getAllDepartment() async {
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
      final response = await dio.get(departmentGetAllPath);
      if (response.statusCode == HttpStatus.ok) {
        return DepartmentResponseModel.fromJson(response.data);
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
  Future deleteDepartment(int id) async {
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
      final response = await dio.delete(departmentdeletePath, data: {'id': id});
      if (response.statusCode == HttpStatus.ok) {
        return BaseResponseModel.fromJson(response.data);
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
  Future updateDepartment(DepartmentUpdateRequestModel model) async {
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
      final response = await dio.patch(
        departmentUpdatePath,
        data: model,
      );
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
