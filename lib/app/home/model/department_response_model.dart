class DepartmentResponseModel {
  List<Data>? data;
  bool? success;
  String? message;

  DepartmentResponseModel({this.data, this.success, this.message});

  DepartmentResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
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
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}

class Data {
  int? id;
  String? departmentName;

  Data({this.id, this.departmentName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    departmentName = json['departmentName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['departmentName'] = departmentName;
    return data;
  }
}
