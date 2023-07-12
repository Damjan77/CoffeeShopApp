import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:coffe_shop_app/services/nearby_response.dart';
import 'package:http/http.dart' as http;

class NearByPlacesScreen extends StatefulWidget {
  static const String idScreen = "nearbyScreen";
  const NearByPlacesScreen({Key? key}) : super(key: key);

  @override
  State<NearByPlacesScreen> createState() => _NearByPlacesScreenState();
}

class _NearByPlacesScreenState extends State<NearByPlacesScreen> {

  String apiKey = "AIzaSyDzS5EdV9zNC08WSitS09Jw-YD_s7Fs398";
  String radius = "1000";
  String types = "cafe";
  double latitude = 42.00478491557928;
  double longitude = 21.40917442067392;

  NearbyPlacesResponse nearbyPlacesResponse = NearbyPlacesResponse();

  // import 'package:geolocator/geolocator.dart';
  // List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(52.2165157, 6.9437819);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Places'),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){

              getNearbyPlaces();

            }, child: const Text("Get Nearby Places")),

            if(nearbyPlacesResponse.results != null)
              for(int i = 0 ; i < nearbyPlacesResponse.results!.length; i++)
                nearbyPlacesWidget(nearbyPlacesResponse.results![i])
          ],
        ),
      ),
    );
  }

  void getNearbyPlaces() async {

    var url = Uri.parse('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=' + latitude.toString() + ','
        + longitude.toString() + '&radius=' + radius + '&types=' + types +'&key=' + apiKey
    );

    var response = await http.post(url);

    nearbyPlacesResponse = NearbyPlacesResponse.fromJson(jsonDecode(response.body));

    setState(() {});

  }

  Widget nearbyPlacesWidget(Results results) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 10,left: 10,right: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Text("Name: " + results.name!),
          Text("Location: " + results.geometry!.location!.lat.toString() + " , " + results.geometry!.location!.lng.toString()),
          Text(results.openingHours != null ? "Open" : "Closed"),
        ],
      ),
    );

  }
}