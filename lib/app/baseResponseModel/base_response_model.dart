class BaseResponseModel {
  bool? success;
  String? message;

  BaseResponseModel({this.success, this.message});

  BaseResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() => {'success': success, 'message': message};
}
