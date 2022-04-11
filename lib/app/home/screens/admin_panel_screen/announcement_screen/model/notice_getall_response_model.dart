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
  Null? file;

  NoticeData(
      {this.id,
      this.departmentId,
      this.title,
      this.content,
      this.createdAt,
      this.updatedAt,
      this.imagePath,
      this.file});

  NoticeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    departmentId = json['departmentId'];
    title = json['title'];
    content = json['content'];
    createdAt = json['created_At'];
    updatedAt = json['updated_At'];
    imagePath = json['imagePath'];
    file = json['file'];
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
    data['file'] = this.file;
    return data;
  }
}
