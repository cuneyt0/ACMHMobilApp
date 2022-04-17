import '../../../../../../export_import.dart';

abstract class IAnnouncementService {
  Dio dio;

  IAnnouncementService({required this.dio});

  final String noticePath = IAnnouncementServicePath.Announcement.rawValue;
  final String noticeUpdatePath = IAnnouncementServicePath.Update.rawValue;

  Future<dynamic?> postNotice(NoticeRequestModel model);
  Future<dynamic?> updateNotice(NoticeRequestModel model);
}

enum IAnnouncementServicePath { Announcement, Update }

extension IAnnouncementServicePathExtension on IAnnouncementServicePath {
  String get rawValue {
    switch (this) {
      case IAnnouncementServicePath.Announcement:
        return '/add';
      case IAnnouncementServicePath.Update:
        return '/update';
    }
  }
}
