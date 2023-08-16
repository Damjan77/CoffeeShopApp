import 'package:coffe_shop_app/custom/custom_app_bar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/gallery_controller.dart';
import './storage_service.dart';


class GalleryService extends StatefulWidget {
  static const String idScreen = "galleryService";

  @override
  _GalleryServiceState createState() => _GalleryServiceState();
}

class _GalleryServiceState extends State<GalleryService> {
  XFile? imageFile;
  final Storage storage = Storage();
  GalleryController galleryController = Get.put(GalleryController());

  @override
  void initState() {
    super.initState();
    galleryController.loadImages();
  }



  getImage(ImageSource source) async {
    imageFile = await ImagePicker().pickImage(source: source);
    if (imageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No file selected.")),
      );
      return null;
    }
    final path = imageFile!.path;
    final fileName = galleryController.generateRandomString(5);
    storage.uploadFile(path, fileName).then((value) => print('Done'));
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
                  Padding(padding: EdgeInsets.all(10.0)),
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

  GridView photoContainer(AsyncSnapshot<List<Map<String, dynamic>>> snapshot){
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
                    borderRadius: const BorderRadius.all(
                        Radius.circular(10)),
                    image: DecorationImage(
                        image: NetworkImage(
                            snapshot.data![index]['url']),
                        fit: BoxFit.cover))));
      },
    );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              _showDialog(context);
            },
            label: const Text("Share & get sale!"),
            backgroundColor: const Color(0xFF7B5B36),
            icon: Icon(Icons.camera_alt),
            foregroundColor: Colors.white),
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
                  future: galleryController.loadImages(),
                  builder: (context,
                      AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      return photoContainer(snapshot);
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }
}
