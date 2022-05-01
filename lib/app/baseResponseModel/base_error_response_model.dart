class BaseErrorResponseModel {
  bool? success;
  String? message;

  BaseErrorResponseModel({this.success, this.message});

  BaseErrorResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() => {'success': success, 'message': message};
}
