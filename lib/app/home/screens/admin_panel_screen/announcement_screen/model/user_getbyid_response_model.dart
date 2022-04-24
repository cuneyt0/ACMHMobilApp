class UserGetByIdModel {
  UserGetByIdBodyModel? data;
  bool? success;
  String? message;

  UserGetByIdModel({this.data, this.success, this.message});

  UserGetByIdModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new UserGetByIdBodyModel.fromJson(json['data'])
        : null;
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}

class UserGetByIdBodyModel {
  int? id;
  String? firstName;
  String? lastName;
  int? departmentId;
  String? schoolNumber;
  String? nationalNumberHash;
  String? nationalNumberSalt;

  UserGetByIdBodyModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.departmentId,
      this.schoolNumber,
      this.nationalNumberHash,
      this.nationalNumberSalt});

  UserGetByIdBodyModel.fromJson(Map<String, dynamic> json) {
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
