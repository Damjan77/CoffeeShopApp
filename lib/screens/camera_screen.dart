import 'package:camera/camera.dart';
import 'package:coffe_shop_app/screens/camera_page.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget{
  static const String idScreen = "cameraScreen";

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen>{

  // Obtain a list of the available cameras on the device.
  //final cameras = await availableCameras();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: SafeArea(
        child: Center(
            child: ElevatedButton(
              onPressed: () async {
                await availableCameras().then((value) => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => CameraPage(cameras: value))));
              },
              child: const Text("Take a Picture"),
            )),
      ),
    );
  }
}