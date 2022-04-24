class NoticeRequestModel {
  int? id;
  int? departmentId;
  String? title;
  String? content;
  String? createdAt;
  String? updatedAt;
  String? imagePath;
  String? pdfPath;
  int? userId;

  NoticeRequestModel.ID(
      {this.id,
      this.departmentId,
      this.title,
      this.content,
      this.createdAt,
      this.updatedAt,
      this.imagePath,
      this.pdfPath,
      this.userId});
  NoticeRequestModel(
      {this.departmentId,
      this.title,
      this.content,
      this.createdAt,
      this.updatedAt,
      this.imagePath,
      this.pdfPath,
      this.userId});

  NoticeRequestModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    departmentId = json['departmentId'];
    title = json['title'];
    content = json['content'];
    createdAt = json['created_At'];
    updatedAt = json['updated_At'];
    imagePath = json['imagePath'];
    pdfPath = json['pdfPath'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['departmentId'] = departmentId;
    data['title'] = title;
    data['content'] = content;
    data['created_At'] = createdAt;
    data['updated_At'] = updatedAt;
    data['imagePath'] = imagePath;
    data['pdfPath'] = pdfPath;
    data['userId'] = userId;
    return data;
  }
}
