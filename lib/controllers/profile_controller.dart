import 'package:coffe_shop_app/services/gallery_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../custom/custom_box_widgets.dart';

class ProfileController extends GetxController{

  Padding openGallery(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0),
      child: FloatingActionButton.extended(
        heroTag: 'btn1',
        onPressed: () {
          Get.to(() => GalleryService());
        },
        backgroundColor: primaryColor,
        label: const Text("OPEN IMAGE GALLERY"),
        icon: const Icon(Icons.camera),
      ),
    );
  }


}