

import 'dart:io';
import 'dart:typed_data';

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'content_type_enum.dart';

class SaveFileManager {
  SaveFileManager._();

  static Future<File?> saveFileFolder(
      {required Uint8List data,
      required String fileName,
      required String? contentType}) async {
    try {
      if (contentType == ContentTypeEnum.IMAGE_BMP.rawValue ||
          contentType == ContentTypeEnum.IMAGE_GIF.rawValue ||
          contentType == ContentTypeEnum.IMAGE_JPEG.rawValue ||
          contentType == ContentTypeEnum.IMAGE_JPG.rawValue ||
          contentType == ContentTypeEnum.IMAGE_PNG.rawValue) {
        if (await storagePermission(Permission.photos)) {
          await ImageGallerySaver.saveImage(data, name: fileName);
      
        } else {
  
        }
      } else {
        if (await storagePermission(Permission.storage)) {
          if (Platform.isAndroid) {
            final generalDownloadDir =
                Directory('/storage/emulated/0/Download/');
            final saveFile = File('${generalDownloadDir.path}/$fileName');
            final save = await saveFile.open(mode: FileMode.write);
            await save.writeFrom(data);
            await save.close();
          
            return saveFile;
          } else {
            final directory = await getApplicationDocumentsDirectory();
            final file = File('${directory.path}/$fileName');

            final exits = await file.exists();
            if (exits == false) {
              final createFolder = await file.create(recursive: true);
              final save = await createFolder.open(mode: FileMode.write);

              await save.close();
      

              return createFolder;
            } else {
              final save = await file.open(mode: FileMode.write);
              await save.writeFrom(data);
              await save.close();
         

              return file;
            }
          }
        } else {

        }
      }
    } on Exception  {}
  }

  static Future<bool> storagePermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      final result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }

  static Future<OpenResult> showPreview(
      {required Uint8List data,
      required String? type,
      required String? fileName}) async {
    final directory = await getTemporaryDirectory();
    final file = File('${directory.path}/$fileName');
    final openFile = await file.open(mode: FileMode.write);
    final writeFile = await openFile.writeFrom(data);
    final result = await OpenFile.open(writeFile.path, type: type);
    return result;
  }
}



