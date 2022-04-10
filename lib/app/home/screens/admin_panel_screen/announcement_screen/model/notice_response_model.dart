class NoticeResponseModel {
  bool? success;
  String? message;

  NoticeResponseModel({this.success, this.message});

  NoticeResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}
