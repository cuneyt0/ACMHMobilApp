import 'package:login_work/app/login/model/login_response.dart';
import 'package:login_work/export_import.dart';

class GetToken {
  static String? token;
  static LoginResponseModel? loginResponseModel;
  static Future<String?> getToken() async {
    String loginResponseText = await CacheManager().getLoginResponse();
    loginResponseModel =
        LoginResponseModel.fromJson(jsonDecode(loginResponseText));
    token = loginResponseModel?.token ?? "";
    print("TOKENN: ${token}");
    return token;
  }
}


/*

String loginResponseText = await CacheManager().getLoginResponse();
    LoginResponseModel loginResponseModel =
        LoginResponseModel.fromJson(jsonDecode(loginResponseText));
    String token = loginResponseModel.token ?? "";

 */