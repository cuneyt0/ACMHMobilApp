import 'package:login_work/export_import.dart';
import 'package:mobx/mobx.dart';
part 'admin_cafeteria_viewmodel.g.dart';

class AdminCafeteriaGetAllViewModel = _AdminCafeteriaGetAllViewModelBase
    with _$AdminCafeteriaGetAllViewModel;

abstract class _AdminCafeteriaGetAllViewModelBase extends BaseViewModelProtocol
    with Store {
  @observable
  Uint8List? data;
  @observable
  File? file;
  @observable
  Dio dio = Dio();
  @observable
  IAdminCafeteriaService cafeteriaService =
      AdminCafeteriaService(dio: Dio(BaseOptions(baseUrl: cafeteriaAllUrl)));
  @observable
  NoticeGetAllResponseModel? getAllResponse = NoticeGetAllResponseModel();
  @observable
  BaseResponseModel? deleteResponse = BaseResponseModel();
  @observable
  UserGetByIdModel? userGetByIdModel = UserGetByIdModel();
  IAdminCafeteriaService cafeteriaServiceTwo =
      AdminCafeteriaService(dio: Dio(BaseOptions(baseUrl: allUserUrl)));
  @action
  Future<NoticeGetAllResponseModel?> getAllCafeteria() async {
    return getAllResponse = await cafeteriaService.getAllCafeteria();
  }

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

  @action
  Future<UserGetByIdModel?> getByIdUser(int? id) async {
    return userGetByIdModel = await cafeteriaServiceTwo.getByIdUser(id);
  }

  @action
  Future<BaseResponseModel?> deleteCafeteria(int id) async {
    deleteResponse = await cafeteriaService.deleteCafeteria(id);
    await getAllCafeteria();
    Flushbar(
      message: '${deleteResponse?.message}',
      flushbarPosition: FlushbarPosition.TOP,
      duration: const Duration(seconds: 1),
      borderRadius: BorderRadius.circular(2),
      backgroundColor: Colors.black.withOpacity(0.5),
    ).show(buildContext).then((value) => Navigation.ofPop());
    return deleteResponse;
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

  @override
  void setBuildContext(BuildContext buildContext) =>
      this.buildContext = buildContext;
}
