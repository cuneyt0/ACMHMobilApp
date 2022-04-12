import 'package:login_work/app/home/screens/admin_panel_screen/announcement_screen/model/notice_delete_response_model.dart';
import 'package:login_work/app/home/screens/admin_panel_screen/announcement_screen/model/notice_getall_response_model.dart';
import 'package:login_work/export_import.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  @observable
  Dio dio = Dio();
  @observable
  NoticeGetAllResponseModel? responseData = NoticeGetAllResponseModel();
  @observable
  NoticeDeleteResponseModel? deleteResponseData = NoticeDeleteResponseModel();

  @observable
  var photo;

  @action
  Future<void> getAllNotice() async {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    dio.options.headers['Content-Type'] = 'application/json; charset=utf-8';

    //dio.interceptors.add(PrettyDioLogger());
    dio.interceptors.clear();

    try {
      final response = await dio.get(noticegetAll);
      if (response.statusCode == HttpStatus.ok) {
        responseData = NoticeGetAllResponseModel.fromJson(response.data);
        print("noticce getall");
        print(responseData?.data?.length);
        print(response.data);
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

//-------------------ShowImage--------------------------
  @action
  Future<dynamic> getImage(String fileName) async {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    dio.options.headers['Content-Type'] = 'application/json; charset=utf-8';
    dio.interceptors.clear();
    try {
      Response<List<int>> response = await dio.get<List<int>>(noticeImageUrl,
          queryParameters: {'fileName': fileName},
          options: Options(responseType: ResponseType.bytes));
      if (response.statusCode == HttpStatus.ok) {
        return response.data;
      } else {
        null;
      }
    } catch (e) {
      if ((e as DioError).response != null) {
        return null;
      } else {
        "Hata Gerçekleşti";
      }
    }
  }

//-----------------------Delete-------------------------
  @action
  Future<dynamic> delete(int? id) async {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    dio.options.headers['Content-Type'] = 'application/json; charset=utf-8';
    String loginResponseText = await CacheManager().getLoginResponse();
    LoginResponseModel loginResponseModel =
        LoginResponseModel.fromJson(jsonDecode(loginResponseText));
    print(loginResponseText);
    String token = loginResponseModel.token ?? "";
    dio.options.headers['Authorization'] = 'Bearer ${token}';
    dio.interceptors.clear();

    try {
      final response = await dio.delete(noticedelete, data: {'id': id});
      if (response.statusCode == HttpStatus.ok) {
        deleteResponseData = NoticeDeleteResponseModel.fromJson(response.data);
        return deleteResponseData;
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
