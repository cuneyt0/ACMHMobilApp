import 'package:login_work/export_import.dart';
import 'package:mobx/mobx.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase extends BaseViewModelProtocol with Store {
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
  IHomeService servicetwo =
      HomeService(dio: Dio(BaseOptions(baseUrl: activityAllUrl)));
  @observable
  var photo;
  @observable
  Uint8List? data;
  @observable
  File? file;
  @observable
  NoticeGetAllResponseModel? getbyidrecentlyresponse =
      NoticeGetAllResponseModel();
  @observable
  NoticeGetAllResponseModel? getbyidrecentlyActivitiyresponse =
      NoticeGetAllResponseModel();
  @observable
  CafeteriaViewModel? a = CafeteriaViewModel();
  @observable
  NoticeGetAllResponseModel? responseModel = NoticeGetAllResponseModel();

  @action
  Future<NoticeGetAllResponseModel?> getCafeteriRecently() async {
    return responseModel = await a?.service.getCafeteriRecently();
  }

  @action
  Future<NoticeGetAllResponseModel?> getbyidrecently() async {
    return getbyidrecentlyresponse = await service.getbyidrecently();
  }

  @action
  Future<NoticeGetAllResponseModel?> getbyidrecentlyActivities() async {
    return getbyidrecentlyActivitiyresponse =
        await servicetwo.getbyidrecently();
  }

  @override
  void setBuildContext(BuildContext buildContext) =>
      this.buildContext = buildContext;

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
        "Hata Ger??ekle??ti";
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
        "Hata Ger??ekle??ti";
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
        "Hata Ger??ekle??ti";
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
        // photo = response.data;
        return response.data;
      } else {
        print("getImage null");
        null;
      }
    } catch (e) {
      if ((e as DioError).response != null) {
        return null;
      } else {
        "Hata Ger??ekle??ti";
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
        "Hata Ger??ekle??ti";
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
        "Hata Ger??ekle??ti";
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
        month = "??ubat";
        break;
      case 3:
        month = "Mart";
        break;
      case 4:
        month = "Nisan";
        break;
      case 5:
        month = "May??s";
        break;
      case 6:
        month = "Haziran";
        break;
      case 7:
        month = "Temmuz";
        break;
      case 8:
        month = "A??ustos";
        break;
      case 9:
        month = "Eyl??k";
        break;
      case 10:
        month = "Ekim";
        break;
      case 11:
        month = "Kas??m";
        break;
      case 12:
        month = "Aral??k";
        break;
    }
    @observable
    Duration difference = today.difference(tm);

    if (difference.compareTo(oneDay) < 1) {
      return "Bug??n";
    } else if (difference.compareTo(twoDay) < 1) {
      return "D??n";
    } else if (difference.compareTo(oneWeek) < 1) {
      switch (tm.weekday) {
        case 1:
          return "Pazartesi";
        case 2:
          return "Sal??";
        case 3:
          return "??ar??amba";
        case 4:
          return "Per??embe";
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
