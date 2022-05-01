class NoticeDeleteResponseModel {
  bool? success;
  String? message;

  NoticeDeleteResponseModel({this.success, this.message});

  NoticeDeleteResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() => {'success': success, 'message': message};
}
