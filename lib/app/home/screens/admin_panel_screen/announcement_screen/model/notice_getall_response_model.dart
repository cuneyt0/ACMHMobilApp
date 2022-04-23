class NoticeGetAllResponseModel {
  List<NoticeData>? data;
  bool? success;
  String? message;

  NoticeGetAllResponseModel({this.data, this.success, this.message});

  NoticeGetAllResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <NoticeData>[];
      json['data'].forEach((v) {
        data!.add(new NoticeData.fromJson(v));
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

class NoticeData {
  int? id;
  int? departmentId;
  String? title;
  String? content;
  String? createdAt;
  String? updatedAt;
  String? imagePath;
  String? pdfPath;
  Null? file;
  Null? pdfFile;

  NoticeData(
      {this.id,
      this.departmentId,
      this.title,
      this.content,
      this.createdAt,
      this.updatedAt,
      this.imagePath,
      this.pdfPath,
      this.file,
      this.pdfFile});

  NoticeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    departmentId = json['departmentId'];
    title = json['title'];
    content = json['content'];
    createdAt = json['created_At'];
    updatedAt = json['updated_At'];
    imagePath = json['imagePath'];
    pdfPath = json['pdfPath'];
    file = json['file'];
    pdfFile = json['pdfFile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['departmentId'] = this.departmentId;
    data['title'] = this.title;
    data['content'] = this.content;
    data['created_At'] = this.createdAt;
    data['updated_At'] = this.updatedAt;
    data['imagePath'] = this.imagePath;
    data['pdfPath'] = this.pdfPath;
    data['file'] = this.file;
    data['pdfFile'] = this.pdfFile;
    return data;
  }
}
