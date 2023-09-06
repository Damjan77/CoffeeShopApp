import 'package:coffe_shop_app/services/storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class GalleryController {
  XFile? imageFile;
  final Storage storage = Storage();


  Future<List<Map<String, dynamic>>> loadImages() async {
    print("Loading images...");
    List<Map<String, dynamic>> files = [];

    final ListResult result = await FirebaseStorage.instance.ref('images').list();
    final List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      files.add({
        "url": fileUrl,
        "path": file.fullPath,
      });
    });
    return files;
  }
}