class LoginRequestModel {
  String? username;
  String? password;

  LoginRequestModel({this.username, this.password});

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    username = json['Username'];
    password = json['Password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Username'] = this.username;
    data['Password'] = this.password;
    return data;
  }
}