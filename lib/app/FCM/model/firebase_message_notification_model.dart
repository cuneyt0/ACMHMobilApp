class FirebaseMessageNotificationModel {
  String? body;
  String? title;
  String? subtitle;

  FirebaseMessageNotificationModel({this.body, this.title, this.subtitle});

  FirebaseMessageNotificationModel.fromJson(Map<String, dynamic> json) {
    body = json['body'];
    title = json['title'];
    subtitle = json['subtitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['body'] = this.body;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    return data;
  }
}
