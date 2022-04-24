// ignore_for_file: constant_identifier_names
enum ContentTypeEnum {
  IMAGE_BMP,
  IMAGE_GIF,
  IMAGE_JPEG,
  IMAGE_JPG,
  IMAGE_PNG,
  VIDEO_MP4
}

extension ContentTypeRawValue on ContentTypeEnum {
  String? get rawValue {
    switch (this) {
      case ContentTypeEnum.IMAGE_BMP:
        return 'image/bmp';
      case ContentTypeEnum.IMAGE_GIF:
        return 'image/gif';
      case ContentTypeEnum.IMAGE_JPEG:
        return 'image/jpeg';
      case ContentTypeEnum.IMAGE_JPG:
        return 'image/jpg';
      case ContentTypeEnum.IMAGE_PNG:
        return 'image/png';
      case ContentTypeEnum.VIDEO_MP4:
        return 'video/mp4';
    }
  }
}
