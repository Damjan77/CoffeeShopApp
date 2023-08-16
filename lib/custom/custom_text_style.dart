import 'package:coffe_shop_app/custom/custom_box_widgets.dart';
import 'package:flutter/material.dart';

class CustomTextStyle{
  static const TextStyle customTextStyle = TextStyle(
      color: primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 25);

  static const TextStyle subtitleTextStyle = TextStyle(
      color: primaryColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
  );

  static const TextStyle infoTextStyle = TextStyle(
    fontStyle: FontStyle.italic,
    color: Colors.grey,
    fontSize: 14,
  );
}