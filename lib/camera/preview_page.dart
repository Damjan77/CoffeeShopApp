import 'package:camera/camera.dart';
import 'package:coffe_shop_app/custom/custom_app_bar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PreviewPage extends StatefulWidget {
  static const String idScreen = "previewPage";

  @override
  _PreviewPageState createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  File? photo;
  XFile? imageFile;

  getImage(ImageSource source) async {
    imageFile = await ImagePicker().pickImage(source: source);
    print('${imageFile?.path}');
  }

  Future uploadFile() async {
    if (imageFile == null) return;
    final ref = FirebaseStorage.instance.ref().child('images').child('name');
    try {
      await ref.putFile(File(imageFile!.path));
    } catch (e) {
      print('An error has occurred');
    }
  }

  Future<List<Map<String, dynamic>>> _loadImages() async {
    List<Map<String, dynamic>> files = [];

    final ListResult result = await FirebaseStorage.instance.ref().list();
    final List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      print('Found file');
      final String fileUrl = await FirebaseStorage.instance
          .ref()
          .child('images')
          .child('name')
          .getDownloadURL();
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
              FutureBuilder(
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
              ),
            ],
          ),
        ));
  }
}
