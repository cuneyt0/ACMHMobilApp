class DepartmentAddRequestModel {
  String? departmentName;

  DepartmentAddRequestModel({this.departmentName});

  DepartmentAddRequestModel.fromJson(Map<String, dynamic> json) {
    departmentName = json['departmentName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['departmentName'] = departmentName;
    return data;
  }
}
