import 'dart:convert';
import 'dart:developer';

import 'package:coffe_shop_app/custom/custom_text_style.dart';
import 'package:coffe_shop_app/model/Shop.dart';
import 'package:coffe_shop_app/view/cart_screen.dart';
import 'package:coffe_shop_app/view/home_screen.dart';
import 'package:coffe_shop_app/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../custom/custom_app_bar.dart';
import '../custom/custom_box_widgets.dart';
import '../model/Coffee.dart';

class CoffeeShopsScreen extends StatefulWidget {
  static const String idScreen = "mapScreen";

  CoffeeShopsScreen();

  @override
  _CoffeeShopsScreenState createState() => _CoffeeShopsScreenState();
}

class _CoffeeShopsScreenState extends State<CoffeeShopsScreen> {
  List<Shop> mapModel = <Shop>[].obs;

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
            .map((e) => Shop.fromJson(e))
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
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Card(
                color: secondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                    padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.coffee_rounded,
                          color: primaryColor,
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
                                  style: CustomTextStyle.subtitleTextStyle),
                              addVerticalSpace(5),
                              Text("Location: " + address,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyle.infoTextStyle),
                              addVerticalSpace(5),
                              Text("Rating: " + rating.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.right,
                                  style: CustomTextStyle.infoTextStyle),
                              addVerticalSpace(5),
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
