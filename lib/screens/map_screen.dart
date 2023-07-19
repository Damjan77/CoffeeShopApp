import 'package:coffe_shop_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    mapController.fetchLocations();
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
                    Icon(
                      Icons.add_business_rounded,
                      size: 30.0,
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(),
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
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      )),
    );
  }

// floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
// floatingActionButton: FloatingActionButton(
//   backgroundColor: Colors.white,
//   onPressed: () async {
//     getUserCurrentLocation().then((value) async {
//       print(value.latitude.toString() + " " + value.longitude.toString());
//
//       CameraPosition cameraPosition = new CameraPosition(
//         target: LatLng(value.latitude, value.longitude),
//         zoom: 14,
//       );
//
//       final GoogleMapController controller = await _controller.future;
//       controller
//           .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
//       setState(() {});
//     });
//   },
//   child: Icon(
//     Icons.my_location_sharp,
//     color: Colors.black,
//   ),
// ),

}
