import 'dart:io';

import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';

class ImageFileHelper {
  static Future<File> getImageFile(String imageName) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    return File(appDocDir.path + Platform.pathSeparator + imageName);
  }

  static Future<File> write(String imageName, Uint8List bytes) async {
    final imageFile = await getImageFile(imageName);
    await imageFile.create(recursive: true);
    return await imageFile.writeAsBytes(bytes);
  }

  static Future<Uint8List?> readImageFile(String imageName) async {
    final imageFile = await getImageFile(imageName);
    if (!(await imageFile.exists())) {
      return null;
    }
    return await imageFile.readAsBytes();
  }

  static Future<bool> exists(String imageName) async {
    final imageFile = await getImageFile(imageName);
    return await imageFile.exists();
  }
}