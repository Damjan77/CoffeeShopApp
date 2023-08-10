import 'dart:html';
import 'dart:math';
import 'package:coffe_shop_app/services/storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GalleryController {
  XFile? imageFile;
  final Storage storage = Storage();


  String generateRandomString(int lengthOfString) {
    final random = Random();
    const allChars =
        'AaBbCcDdlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1EeFfGgHhIiJjKkL234567890';
    final randomString = List.generate(lengthOfString,
            (index) => allChars[random.nextInt(allChars.length)]).join();
    return randomString; // return the generated string
  }



  Future<List<Map<String, dynamic>>> loadImages() async {
    print("Loading images...");
    List<Map<String, dynamic>> files = [];

    final ListResult result = await FirebaseStorage.instance.ref('images').list();
    final List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      final FullMetadata fileMeta = await file.getMetadata();
      files.add({
        "url": fileUrl,
        "path": file.fullPath,
      });
    });
    return files;
  }


}