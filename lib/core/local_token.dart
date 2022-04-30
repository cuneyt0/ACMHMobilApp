import 'package:login_work/app/login/model/login_response.dart';
import 'package:login_work/export_import.dart';

class GetToken {
  static String? token;
  static LoginResponseModel? loginResponseModel;
  static int? deparmentId;
  static Future<String?> getToken() async {
    String loginResponseText = await CacheManager().getLoginResponse();
    loginResponseModel =
        LoginResponseModel.fromJson(jsonDecode(loginResponseText));
    token = loginResponseModel?.token ?? "";
    deparmentId = loginResponseModel?.user?.departmentId;
    print("TOKENN: ${token}");
    return token;
  }
}
