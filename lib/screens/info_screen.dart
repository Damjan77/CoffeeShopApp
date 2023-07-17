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

  // TextEditingController controller = TextEditingController();
  //
  // _InfoState();
  //
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: const Color(0xFFFCF5C9),
  //     appBar: CustomAppBar(appBar: AppBar(), widgets: [
  //       Padding(
  //           padding: const EdgeInsets.only(right: 16.0, top: 30.0),
  //           child: GestureDetector(
  //             child: Stack(
  //               alignment: Alignment.topCenter,
  //               children: <Widget>[
  //                 Icon(
  //                   Icons.account_circle,
  //                   size: 30.0,
  //                 ),
  //               ],
  //             ),
  //             onTap: () {
  //               Navigator.of(context).push(
  //                 MaterialPageRoute(
  //                   builder: (context) => ProfileScreen(),
  //                 ),
  //               );
  //             },
  //           ))
  //     ],
  //     ),
  //     body: Container(
  //         alignment: Alignment.center,
  //         child: Padding(
  //             padding: EdgeInsets.fromLTRB(
  //                 20, MediaQuery.of(context).size.height * 0.07, 20, 0),
  //             child: Column(children: <Widget>[
  //               const Text(
  //                 "Scan for more info",
  //                 style: TextStyle(
  //                     color: Color(0xFF7B5B36),
  //                     fontWeight: FontWeight.bold,
  //                     fontSize: 40),
  //               ),
  //               SizedBox(height: 40),
  //               QrImage(
  //                 data:
  //                     "https://yourcoffeeandtea.com/different-types-of-coffee/?fbclid=IwAR0tVe1EJTRCvCgdz7DPp-oCbHTkufNFVCqrgFlaiTFbi0ZjTw69-cB2BjI",
  //                 size: 250,
  //                 gapless: true,
  //                 version: QrVersions.auto,
  //                 foregroundColor: const Color(0xFF7B5B36),
  //                 backgroundColor: const Color(0xFFFFFFFF),
  //                 eyeStyle: const QrEyeStyle(eyeShape: QrEyeShape.circle),
  //               ),
  //               SizedBox(height: 50),
  //               const Text(
  //                 "Share more info on the types of coffee you can order, with your firends!",
  //                 style: TextStyle(
  //                     color: Color(0xFF9D622B),
  //                     fontWeight: FontWeight.bold,
  //                     fontSize: 20),
  //                 textAlign: TextAlign.center,
  //               ),
  //             ]))),
  //   );
  // }
}
