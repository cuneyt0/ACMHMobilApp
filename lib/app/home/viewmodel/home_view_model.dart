import 'package:login_work/app/home/service/HomeService.dart';
import 'package:login_work/app/home/service/IHomeService.dart';
import 'package:login_work/export_import.dart';
import 'package:mobx/mobx.dart';

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
  DepartmentGetByIdModel? departmentGetByIdResponseModel =
      DepartmentGetByIdModel();
  @observable
  UserGetByIdModel? userGetByIdModel = UserGetByIdModel();
  @observable
  IHomeService service = HomeService(dio: Dio(BaseOptions(baseUrl: noticeAdd)));
  @observable
  var photo;
  @observable
  Uint8List? data;
  @observable
  File? file;
  @observable
  NoticeGetAllResponseModel? getbyidrecentlyresponse =
      NoticeGetAllResponseModel();

  @action
  Future<NoticeGetAllResponseModel?> getbyidrecently() async {
    return getbyidrecentlyresponse = await service.getbyidrecently();
  }

  @action
  Future<NoticeGetAllResponseModel?> getAllNotice() async {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    dio.options.headers['Content-Type'] = 'application/json; charset=utf-8';
    await GetToken.getToken();
    dio.options.headers['Authorization'] = 'Bearer ${GetToken.token}';
    //dio.interceptors.add(PrettyDioLogger());
    dio.interceptors.clear();
    try {
      final response = await dio.get(noticegetAll);
      if (response.statusCode == HttpStatus.ok) {
        responseData = NoticeGetAllResponseModel.fromJson(response.data);
        return responseData;
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

  //--------------------DepartmentGetById-----------
  @action
  Future<DepartmentGetByIdModel?> getByIdDepartment(int? id) async {
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
          await dio.get(departmentGetByIdUrl, queryParameters: {'id': id});
      if (response.statusCode == HttpStatus.ok) {
        departmentGetByIdResponseModel =
            DepartmentGetByIdModel.fromJson(response.data);
        return departmentGetByIdResponseModel;
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

  //---------------------getByIdUser-----------
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
        print("getImage null");
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

  //-------------------ShowPdf--------------------------
  @action
  Future<dynamic> getPdfShow(String fileName) async {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    dio.options.headers['Content-Type'] = 'application/json; charset=utf-8';
    dio.interceptors.clear();
    try {
      Response<dynamic> response = await dio.get(noticePdfUrl,
          queryParameters: {'fileName': fileName},
          options: Options(responseType: ResponseType.bytes));
      if (response.statusCode == HttpStatus.ok) {
        data = response.data;
        file = await SaveFileManager.saveFileFolder(
            data: response.data, fileName: fileName, contentType: "pdf");
        return response.data;
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

//-----------------------Delete-------------------------
  @action
  Future<NoticeDeleteResponseModel?> delete(int? id) async {
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
      final response = await dio.delete(noticedelete, data: {'id': id});
      if (response.statusCode == HttpStatus.ok) {
        deleteResponseData = NoticeDeleteResponseModel.fromJson(response.data);
        return deleteResponseData;
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

  @action
  String dateFormat(DateTime tm) {
    @observable
    DateTime today = new DateTime.now();
    @observable
    Duration oneDay = new Duration(days: 1);
    @observable
    Duration twoDay = new Duration(days: 2);
    @observable
    Duration oneWeek = new Duration(days: 7);
    @observable
    String? month;
    switch (tm.month) {
      case 1:
        month = "Ocak";
        break;
      case 2:
        month = "Şubat";
        break;
      case 3:
        month = "Mart";
        break;
      case 4:
        month = "Nisan";
        break;
      case 5:
        month = "Mayıs";
        break;
      case 6:
        month = "Haziran";
        break;
      case 7:
        month = "Temmuz";
        break;
      case 8:
        month = "Ağustos";
        break;
      case 9:
        month = "Eylük";
        break;
      case 10:
        month = "Ekim";
        break;
      case 11:
        month = "Kasım";
        break;
      case 12:
        month = "Aralık";
        break;
    }
    @observable
    Duration difference = today.difference(tm);

    if (difference.compareTo(oneDay) < 1) {
      return "Bugün";
    } else if (difference.compareTo(twoDay) < 1) {
      return "Dün";
    } else if (difference.compareTo(oneWeek) < 1) {
      switch (tm.weekday) {
        case 1:
          return "Pazartesi";
        case 2:
          return "Salı";
        case 3:
          return "Çarşamba";
        case 4:
          return "Perşembe";
        case 5:
          return "Cuma";
        case 6:
          return "Cumartesi";
        case 7:
          return "Pazar";
      }
    } else if (tm.year == today.year) {
      return '${tm.day} $month';
    } else {
      return '${tm.day} $month ${tm.year}';
    }
    return "";
  }
}
