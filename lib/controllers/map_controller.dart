import 'dart:convert';
import 'dart:developer';
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:coffe_shop_app/controllers/cart_controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:coffe_shop_app/model/Shop.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import '../view/order_successfull_screen.dart';

class MapController extends GetxController {
  List<Shop> mapModel = <Shop>[].obs;
  var markers = RxSet<Marker>();
  var isLoading = false.obs;
  final cartController = Get.find<CartController>();
  var passedArguments = Get.arguments;


  fetchLocations() async {
    try {
      isLoading(true);
      http.Response response = await http.get(Uri.tryParse(
          'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=42.00478491557928,21.40917442067392&radius=5000&types=cafe&keyword=specialty&key=AIzaSyDzS5EdV9zNC08WSitS09Jw-YD_s7Fs398')!);
      if (response.statusCode == 200) {
        ///data successfully
        var result = jsonDecode(response.body);
        log(result.toString());
        mapModel.addAll(RxList<Map<String, dynamic>>.from(result["results"])
            .map((e) => Shop.fromJson(e))
            .toList());
      } else {
        print('error fetching data');
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isLoading(false);
      print('finally: $mapModel');
      createMarkers();
    }
  }

  static Future<Uint8List?> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png))
        ?.buffer
        .asUint8List();
  }


  createMarkers() async {
    Uint8List? markerIcon =
        await getBytesFromAsset("assets/images/pin.png", 150);
    mapModel.forEach((element) {
      markers.add(Marker(
        markerId: MarkerId(element.placeId.toString()),
        icon: BitmapDescriptor.fromBytes(markerIcon!),
        position: LatLng(
            element.geometry.coordinates.lat, element.geometry.coordinates.lng),
        infoWindow: InfoWindow(title: element.name, snippet: element.vicinity,
        onTap: () {
          print('info window is tapped');
          Get.to(() => OrderSuccessfullScreen(shop: element), arguments: passedArguments);
        }),
        onTap: () {
          print('market tapped');
        },
      ));
    });
  }
}
