import 'dart:ffi';

import 'package:login_work/app/home/model/department_response_model.dart';
import 'package:login_work/export_import.dart';
import 'package:mobx/mobx.dart';
part 'announcement_view_model.g.dart';

class AnnouncementViewModel = _AnnouncementViewModelBase
    with _$AnnouncementViewModel;

abstract class _AnnouncementViewModelBase with Store {
  @observable
  DepartmentResponseModel? responseData = DepartmentResponseModel();
  @observable
  Dio dio = Dio();
  @observable
  Data? dropdownvalue;
  @action
  Future<void> getAllDepartment() async {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    dio.options.headers['Content-Type'] = 'application/json; charset=utf-8';

    dio.interceptors.add(PrettyDioLogger());

    try {
      final response = await dio.get(departmentgetAll);
      if (response.statusCode == HttpStatus.ok) {
        responseData = DepartmentResponseModel.fromJson(response.data);
      } else {
        null;
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
