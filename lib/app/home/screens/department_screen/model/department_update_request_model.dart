class DepartmentUpdateRequestModel {
  int? id;
  String? departmentName;

  DepartmentUpdateRequestModel({this.id, this.departmentName});

  DepartmentUpdateRequestModel.fromJson(Map<String, dynamic> json) {
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