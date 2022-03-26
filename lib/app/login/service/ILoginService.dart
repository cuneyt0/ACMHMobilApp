import 'package:login_work/export_import.dart';

abstract class ILoginService {
  final Dio dio;

  ILoginService(this.dio);

  final String loginPath = ILoginServicePath.LOGIN.rawValue;

  Future<dynamic?> postUserLogin(LoginRequestModel model);
}

enum ILoginServicePath { LOGIN }

extension ILoginSericePathExtension on ILoginServicePath {
  String get rawValue {
    switch (this) {
      case ILoginServicePath.LOGIN:
        return '/login';
    }
  }
}
