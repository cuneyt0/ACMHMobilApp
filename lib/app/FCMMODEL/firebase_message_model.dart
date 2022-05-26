import 'package:login_work/app/FCMMODEL/firebase_message_notification_model.dart';

class FirebaseMessageModel {
  String? to;
  FirebaseMessageNotificationModel? notification;

  FirebaseMessageModel({this.to, this.notification});

  FirebaseMessageModel.fromJson(Map<String, dynamic> json) {
    to = json['to'];
    notification = json['notification'] != null
        ? new FirebaseMessageNotificationModel.fromJson(json['notification'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['to'] = this.to;
    if (this.notification != null) {
      data['notification'] = this.notification!.toJson();
    }
    return data;
  }  
}



