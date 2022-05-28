import 'package:login_work/app/FCM/model/firebase_message_model.dart';


import '../../../../../../export_import.dart';

abstract class IFCMService {
  Dio dio;
  IFCMService({required this.dio});

  final String fmcPath = IFCMServicePath.fcm.rawValue;

  
  Future<dynamic?> sendNotificationMessage(FirebaseMessageModel? message);
}

enum IFCMServicePath {fcm}

extension IFCMServicePathExtension on IFCMServicePath {
  String get rawValue {
    switch (this) {
      case IFCMServicePath.fcm:
        return '/fcm/send';
    }
  }
}
