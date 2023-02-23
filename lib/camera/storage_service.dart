import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class Storage {
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> uploadFile(String filePath, String fileName) async {
    File file = File(filePath);

    try {
      await storage.ref('images/$fileName').putFile(file); //change ref 'images/$fileName'
    } on FirebaseException catch(e) {
      print(e);
    }
  }

  Future<ListResult> listFiles() async {
    ListResult results = await storage.ref('images').listAll();

    results.items.forEach((Reference ref) { 
      print('Found file: $ref');
    });
    return results;
  }

  Future<String> downloadURL(String imageName) async {
    String downloadURL = await storage.ref('images/$imageName').getDownloadURL();

    return downloadURL;
  }

}