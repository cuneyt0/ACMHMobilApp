class DepartmentUpdateRequestModel {
  int? id;
  String? departmentName;

  DepartmentUpdateRequestModel({this.id, this.departmentName});

  DepartmentUpdateRequestModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    departmentName = json['departmentName'];
  }
  Map<String, dynamic> toJson() => {'id': id, 'departmentName': departmentName};
}
