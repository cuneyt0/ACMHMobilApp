import 'package:login_work/app/constants/url_constants.dart';
import 'package:login_work/app/home/screens/announcements/service/IPublicAnnoucementService.dart';
import 'package:login_work/app/home/screens/announcements/service/PublicAnnoucementService.dart';
import 'package:login_work/export_import.dart';
import 'package:mobx/mobx.dart';
part 'public_announcements_view_model.g.dart';

class PublicAnnouncementViewModel = _PublicAnnouncementViewModelBase
    with _$PublicAnnouncementViewModel;

abstract class _PublicAnnouncementViewModelBase with Store {
  @observable
  Dio dio = Dio();
  @observable
  IPublicAnnoucementService service =
      PublicAnnoucementService(dio: Dio(BaseOptions(baseUrl: noticeAdd)));
  @observable
  IPublicAnnoucementService servicetwo = PublicAnnoucementService(
      dio: Dio(BaseOptions(baseUrl: departmentAllUrl)));
  @observable
  IPublicAnnoucementService servicetree =
      PublicAnnoucementService(dio: Dio(BaseOptions(baseUrl: AllUserUrl)));
  @observable
  NoticeGetAllResponseModel getByIdResponse = NoticeGetAllResponseModel();
  @observable
  DepartmentGetByIdModel departmentIdResponse = DepartmentGetByIdModel();
  @observable
  UserGetByIdModel userGetByIdModel = UserGetByIdModel();

  @observable
  String? deparmentName = "Bölüme özel";
  @observable
  String? appbartitle = "Bölüme Özel Duyurular";
  @observable
  bool? isChanged = false;
  @observable
  Uint8List? denemeResponse;
  @observable
  var photo;
  @observable
  Uint8List? data;
  @observable
  File? file;
  @action
  Future<void> Changed() async {
    isChanged = !isChanged!;
    if (isChanged == true) {
      deparmentName = 'Genel';
      appbartitle = 'Bölüme Özel Duyurular';

      departmentGetById();
    } else {
      deparmentName = 'Bölüme özel';
      appbartitle = 'Genel Duyurular';
      getPublicByIdDepartmentAnnoucement();
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

  @action
  Future<NoticeGetAllResponseModel?> departmentGetById() async {
    getByIdResponse = await service.getByIdDepartmentAnnoucement();
  }

  @action
  Future<DepartmentGetByIdModelBody?> getByIdDepartment() async {
    departmentIdResponse = await servicetwo.getByIdDepartment();
  }

  @action
  Future<NoticeGetAllResponseModel?>
      getPublicByIdDepartmentAnnoucement() async {
    return getByIdResponse = await service.getPublicByIdDepartmentAnnoucement();
  }

  @action
  Future<UserGetByIdModel?> getByIdUser() async {
    return userGetByIdModel = await servicetree.getByIdUser();
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
