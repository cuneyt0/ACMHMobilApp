class DepartmentAddRequestModel {
  String? departmentName;

  DepartmentAddRequestModel({this.departmentName});

  DepartmentAddRequestModel.fromJson(Map<String, dynamic> json) {
    departmentName = json['departmentName'];
  }

  Map<String, dynamic> toJson() => {'departmentName': departmentName};
}
