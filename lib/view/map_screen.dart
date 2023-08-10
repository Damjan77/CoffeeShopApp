import 'dart:async';
import 'package:coffe_shop_app/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import '../controllers/map_controller.dart';
import '../custom/custom_app_bar.dart';

class MapScreen extends StatefulWidget {
  const MapScreen();

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  MapController mapController = Get.put(MapController());
  late GoogleMapController _controller;

  @override
  void initState() {
    super.initState();
    mapController.fetchLocations();
  }

  Future<Position> userLocationCameraPosition() async {
    // mapController.getUserCurrentLocation().then((value) async {
    //   print("${value.latitude} ${value.longitude}");
    //   CameraPosition cameraPosition = new CameraPosition(
    //     target: LatLng(value.latitude, value.longitude),
    //     zoom: 14,
    //   );
    //   final GoogleMapController controller = await _controller.future;
    //   controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    //   setState(() {});
    // });
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        widgets: [
          Padding(
              padding: const EdgeInsets.only(right: 16.0, top: 30.0),
              child: GestureDetector(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Tooltip(richMessage: TextSpan(
                      text: 'Order to',
                      style: TextStyle(color: Colors.white),
                      children: <InlineSpan>[
                        TextSpan(
                          text: ' pick from the list of available shops',
                        ),
                      ],
                    ),
                        decoration: BoxDecoration(color: Colors.brown),
                      child: Icon(
                        Icons.home_outlined,
                        size: 30.0,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
              ))
        ],
      ),
      body: SafeArea(
          child: Obx(
        () => mapController.mapModel.isNotEmpty
            ? GoogleMap(
                initialCameraPosition: const CameraPosition(
                  target: LatLng(42.00478491557928, 21.40917442067392),
                  zoom: 14.4746,
                ),
                markers: mapController.markers,
                onMapCreated: (GoogleMapController controller) {
                  _controller = controller;
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        mini: true,
        onPressed: () async {
          Position position = await userLocationCameraPosition();
          _controller.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(position.latitude, position.longitude),
                  zoom: 14)));
        },
        child: const Icon(Icons.my_location_rounded, color: Colors.brown),
      ),
    );
  }
}
