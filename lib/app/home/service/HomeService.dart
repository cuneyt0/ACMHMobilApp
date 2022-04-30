import 'package:login_work/export_import.dart';

abstract class IHomeService {
  Dio dio;
  IHomeService({required this.dio});

  final String noticegetbyidrecentlyPath =
      IHomeServicePath.GETBYIDRECENTLY.rawValue;

  Future<dynamic?> getbyidrecently();
}

enum IHomeServicePath {
  GETBYIDRECENTLY,
}

extension IHomeServicePathExtension on IHomeServicePath {
  String get rawValue {
    switch (this) {
      case IHomeServicePath.GETBYIDRECENTLY:
        return '/getbyidrecently';
    }
  }
}
