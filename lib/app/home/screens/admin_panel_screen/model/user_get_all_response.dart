class UserGetAllResponse {
  List<UserBody>? data;
  bool? success;
  String? message;

  UserGetAllResponse({this.data, this.success, this.message});

  UserGetAllResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <UserBody>[];
      json['data'].forEach((v) {
        data!.add(new UserBody.fromJson(v));
      });
    }
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}

class UserBody {
  int? id;
  String? firstName;
  String? lastName;
  int? departmentId;
  String? schoolNumber;
  String? nationalNumberHash;
  String? nationalNumberSalt;

  UserBody(
      {this.id,
      this.firstName,
      this.lastName,
      this.departmentId,
      this.schoolNumber,
      this.nationalNumberHash,
      this.nationalNumberSalt});

  UserBody.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    departmentId = json['departmentId'];
    schoolNumber = json['schoolNumber'];
    nationalNumberHash = json['nationalNumberHash'];
    nationalNumberSalt = json['nationalNumberSalt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['departmentId'] = this.departmentId;
    data['schoolNumber'] = this.schoolNumber;
    data['nationalNumberHash'] = this.nationalNumberHash;
    data['nationalNumberSalt'] = this.nationalNumberSalt;
    return data;
  }
}
