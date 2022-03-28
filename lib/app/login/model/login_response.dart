class LoginResponseModel {
  String? token;
  int? expiration;
  User? user;
  List<UserClaims>? userClaims;

  LoginResponseModel({this.token, this.expiration, this.user, this.userClaims});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expiration = json['expiration'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['userClaims'] != null) {
      userClaims = <UserClaims>[];
      json['userClaims'].forEach((v) {
        userClaims!.add(UserClaims.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = token;
    data['expiration'] = expiration;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (userClaims != null) {
      data['userClaims'] = userClaims!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  int? departmentId;
  String? firstName;
  String? lastName;
  String? schoolNumber;

  User(
      {this.id,
      this.departmentId,
      this.firstName,
      this.lastName,
      this.schoolNumber});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    departmentId = json['departmentId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    schoolNumber = json['schoolNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['departmentId'] = departmentId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['schoolNumber'] = schoolNumber;
    return data;
  }
}

class UserClaims {
  int? id;
  String? name;

  UserClaims({this.id, this.name});

  UserClaims.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
