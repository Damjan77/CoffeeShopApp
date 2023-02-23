import 'package:camera/camera.dart';
import 'package:coffe_shop_app/custom/custom_app_bar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import './storage_service.dart';
import 'dart:io';
import 'dart:math';

class PreviewPage extends StatefulWidget {
  static const String idScreen = "previewPage";

  @override
  _PreviewPageState createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  // File? photo;
  XFile? imageFile;
  final Storage storage = Storage();
  late final images;

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  String generateRandomString(int lengthOfString){
    final random = Random();
    const allChars='AaBbCcDdlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1EeFfGgHhIiJjKkL234567890';
    final randomString = List.generate(lengthOfString, 
                          (index) => allChars[random.nextInt(allChars.length)]).join();
    return randomString;    // return the generated string
}

  getImage(ImageSource source) async {
    imageFile = await ImagePicker().pickImage(source: source);

    if(imageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No file selected.")
        ),
      );
      return null;
    }

    final path = imageFile!.path;
    final fileName = generateRandomString(5);
    
    storage.uploadFile(path, fileName).then((value) => print('Done'));
  }

  Future<List<Map<String, dynamic>>> _loadImages() async {
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

  Future<void> _showDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Pick from: "),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Gallery"),
                    onTap: () {
                      getImage(ImageSource.gallery);
                      Navigator.of(context).pop();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    child: Text("Camera"),
                    onTap: () {
                      getImage(ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(5.0),
          child: FloatingActionButton(
            onPressed: () {
              _showDialog(context);
            },
            backgroundColor: const Color(0xFF7B5B36),
            child: Icon(Icons.camera_alt),
            foregroundColor: Colors.white,
          ),
        ),
        appBar: CustomAppBar(
          appBar: AppBar(),
          widgets: [],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                future: _loadImages(),
                builder: (context,
                    AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemCount: snapshot.data?.length ?? 0,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: EdgeInsets.all(5),
                            child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            snapshot.data![index]['url']),
                                        fit: BoxFit.cover))));
                      },
                    );
                  } else {
                    return const SizedBox.shrink();
                  }},
              ),)
            ],
          ),
        ));
  }
}
