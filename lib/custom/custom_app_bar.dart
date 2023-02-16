import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final List<Widget> widgets;

  const CustomAppBar({super.key, required this.appBar, required this.widgets});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      toolbarHeight: 90,
      title: Image.asset(
        'assets/images/logo.png',
        fit: BoxFit.contain,
        height: 150,
      ),
      centerTitle: true,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: Color(0xFF7B5B36),
        ),
      ),
      actions: widgets,
      leading: GestureDetector(
        child: Icon(Icons.arrow_back_ios),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100.0);
}
