import 'package:login_work/export_import.dart';

abstract class IPublicCafeteriaService {
  Dio dio;
  IPublicCafeteriaService({required this.dio});

  final String cafeteriaPath = IPublicCafeteriaServicePath.GET.rawValue;

  Future<NoticeGetAllResponseModel?> getCafeteriRecently();
}

enum IPublicCafeteriaServicePath { GET }

extension IPublicCafeteriaServicePathExtension on IPublicCafeteriaServicePath {
  String get rawValue {
    switch (this) {
      case IPublicCafeteriaServicePath.GET:
        return '/getrecently';
    }
  }
}
