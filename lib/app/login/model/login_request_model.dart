class LoginRequestModel {
  String? username;
  String? password;

  LoginRequestModel({this.username, this.password});

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    username = json['Username'];
    password = json['Password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Username'] = username;
    data['Password'] = password;
    return data;
  }
}
