class DepartmentGetByIdModel {
  DepartmentGetByIdModelBody? data;
  bool? success;
  String? message;

  DepartmentGetByIdModel({this.data, this.success, this.message});

  DepartmentGetByIdModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new DepartmentGetByIdModelBody.fromJson(json['data'])
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

class DepartmentGetByIdModelBody {
  int? id;
  String? departmentName;

  DepartmentGetByIdModelBody({this.id, this.departmentName});

  DepartmentGetByIdModelBody.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    departmentName = json['departmentName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['departmentName'] = this.departmentName;
    return data;
  }
}
