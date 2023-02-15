import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final AppBar appBar;

  const CustomAppBar({super.key, required this.appBar});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      toolbarHeight: 60,
      title: Image.asset(
        'assets/images/logo-cropped.png',
        fit: BoxFit.contain,
        height: 60,
      ),
      centerTitle: true,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
          color: Color(0xFF7B5B36),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100.0);

}