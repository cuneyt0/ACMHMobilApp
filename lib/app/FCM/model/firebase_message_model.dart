import 'package:login_work/app/FCM/model/firebase_message_notification_model.dart';

class FirebaseMessageModel {
  String? to;
  FirebaseMessageNotificationModel? notification;

  FirebaseMessageModel({this.to, this.notification});

  FirebaseMessageModel.fromJson(Map<String, dynamic> json) {
    to = json['to'];
    notification = json['notification'] != null
        ? FirebaseMessageNotificationModel.fromJson(json['notification'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['to'] = to;
    if (notification != null) {
      data['notification'] = notification!.toJson();
    }
    return data;
  }
}
