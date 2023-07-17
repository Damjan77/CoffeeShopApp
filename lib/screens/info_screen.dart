import 'package:coffe_shop_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import '../controllers/map_controller.dart';
import '../custom/custom_app_bar.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen();

  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<InfoScreen> {
  MapController mapController = Get.put(MapController());

  @override
  void initState(){
    super.initState();
    mapController.fetchLocations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
            () => mapController.mapModel.isNotEmpty
                ? GoogleMap(
                initialCameraPosition: const CameraPosition(
                  target: LatLng(42.00478491557928, 21.40917442067392),
                  zoom: 14.4746,
                ),
              markers: mapController.markers,
            ) : Center(
              child: CircularProgressIndicator(),
            ),
        )
      ),
    );
  }
}
