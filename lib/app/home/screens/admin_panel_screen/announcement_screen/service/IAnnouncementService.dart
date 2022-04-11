import '../../../../../../export_import.dart';

abstract class IAnnouncementService {
  Dio dio;

  IAnnouncementService({required this.dio});

  final String noticePath = IAnnouncementServicePath.Announcement.rawValue;

  Future<dynamic?> postNotice(NoticeRequestModel model);
}

enum IAnnouncementServicePath { Announcement }

extension IAnnouncementServicePathExtension on IAnnouncementServicePath {
  String get rawValue {
    switch (this) {
      case IAnnouncementServicePath.Announcement:
        return '/add';
    }
  }
}
