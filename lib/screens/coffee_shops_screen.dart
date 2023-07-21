import 'dart:convert';
import 'dart:developer';
import 'package:coffe_shop_app/screens/order_successfull_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:coffe_shop_app/model/map_model.dart';
import 'package:coffe_shop_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import '../custom/custom_app_bar.dart';

class CoffeeShopsScreen extends StatefulWidget {
  static const String idScreen = "mapScreen";

  CoffeeShopsScreen();

  @override
  _CoffeeShopsScreenState createState() => _CoffeeShopsScreenState();
}

class _CoffeeShopsScreenState extends State<CoffeeShopsScreen> {
  List<MapModel> mapModel = <MapModel>[].obs;

  _CoffeeShopsScreenState();

  @override
  void initState() {
    super.initState();
    getNearbyPlaces();
  }


  void getNearbyPlaces() async {
    try {
      http.Response response = await http.get(Uri.tryParse(
          'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=42.00478491557928,21.40917442067392&radius=3000&types=cafe&keyword=specialty&key=AIzaSyDzS5EdV9zNC08WSitS09Jw-YD_s7Fs398')!);
      if (response.statusCode == 200) {
        ///data successfully
        var result = jsonDecode(response.body);
        log(result.toString());
        mapModel.addAll(RxList<Map<String, dynamic>>.from(result["results"])
            .map((e) => MapModel.fromJson(e))
            .toList());
      } else {
        print('error fetching data');
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      print('finally: $mapModel');
      setState(() {});
    }
  }

  // Widget nearbyPlacesWidget(MapModel results) {
  //   return Container(
  //     width: MediaQuery.of(context).size.width,
  //     margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
  //     padding: const EdgeInsets.all(5),
  //     decoration: BoxDecoration(
  //         border: Border.all(color: Colors.black),
  //         borderRadius: BorderRadius.circular(10)),
  //     child: Column(
  //       children: [
  //         Text("Name: " + results.name),
  //         Text("Location: " +
  //             results.geometry.location.lat.toString() +
  //             " , " +
  //             results.geometry.location.lng.toString()),
  //         //Text(results.openingHours != null ? "Open" : "Closed"),
  //         Text("Rating: " + results.rating.toString())
  //       ],
  //     ),
  //   );
  // }

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
                      Icons.account_circle,
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
      body: ListView.builder(
          itemCount: mapModel.length,
          itemBuilder: (context, index) {
            final itemData = mapModel[index];
            final name = itemData.name;
            final address = itemData.vicinity;
            final rating = itemData.rating;
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => OrderSuccessfullScreen(),
                  ),
                );
              },
              child: Card(
                color: const Color(0xFFFFEFC7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                    padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.coffee_rounded,
                          color: Colors.brown,
                          size: 32,
                        ),
                        Container(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.brown)),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Location: " + address,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.grey)),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Rating: " + rating.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.grey)),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            );
          }),
    );
  }
}
