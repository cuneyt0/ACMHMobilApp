import 'package:login_work/core/firebase/cloud_message/cloud_message.dart';
import 'package:login_work/export_import.dart';

class GetToken {
  static String? token;
  static LoginResponseModel? loginResponseModel;
  static int? deparmentId;
  static String? messageToken;
  static Future<String?> getToken() async {
     messageToken = await CloudMessages.instance.getNotificationToken();
    String loginResponseText = await CacheManager().getLoginResponse();
    loginResponseModel =
        LoginResponseModel.fromJson(jsonDecode(loginResponseText));
    token = loginResponseModel?.token ?? "";
    deparmentId = loginResponseModel?.user?.departmentId;
    print("TOKENN: ${token}");
    print("MESSAGETOKENN: ${messageToken}");
    return token;
  }
}
