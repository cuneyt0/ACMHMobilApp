

import 'package:login_work/app/FCM/model/firebase_message_succes_response_model.dart';

import 'package:login_work/export_import.dart';

class FCMService extends IFCMService {
  FCMService({required Dio dio}) : super(dio: dio);

  @override
  Future<dynamic?> sendNotificationMessage(
      FirebaseMessageModel? message) async {
    dio.interceptors.add(PrettyDioLogger());
    await GetToken.getToken();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Authorization'] =
        'key=AAAAbq9jA3E:APA91bHpfxUmj4Z1uFXW02Fye-hqwMwi19sZ_rGb-9EZ7u7RfVwVqq_GxVp9tgmausfCjHFN9-Zu8UhuPO8OQopevuGVBGHDJKGTQZrqfeVLFX1-eYcTrVcKhwKv1iE6AktZ-mnMkuYn';
    try {
      final response = await dio.post(
        fmcPath,
        data: message,
      );
      if (response.statusCode == HttpStatus.ok) {
        return FirebaseMessageSuccesResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      if ((e as DioError).response != null) {
        return e.response!.data;
      } else {
        return "Hata Gerçekleşti";
      }
    }
  }
}
