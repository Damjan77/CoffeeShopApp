import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_shop_app/controllers/profile_controller.dart';
import 'package:coffe_shop_app/custom/custom_app_bar.dart';
import 'package:coffe_shop_app/custom/custom_box_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../custom/custom_text_style.dart';
import '../services/logout_service.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen();

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
  _ProfileState();

  ProfileController profileController = Get.put(ProfileController());
  final LogoutService _logoutController = Get.put(LogoutService());
  late String userAddress = '';
  var currentUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    getUserAddress();
  }

  Future getUserAddress() async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          userAddress = snapshot.data()!["address"];
          print(userAddress);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            profileController.openGallery(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton.extended(
                heroTag: 'btn2',
                onPressed: (){
                  _logoutController.signOut(context);
                },
                backgroundColor: primaryColor,
                label: Text("LOGOUT"),
                icon: Icon(Icons.logout_rounded),
              ),
            )
          ],
        ),

        backgroundColor: backgroundColor,
        appBar: CustomAppBar(
          appBar: AppBar(),
          widgets: [],
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            const SizedBox(
              width: double.infinity,
              height: 50,
              child: Center(
                child: Text(
                  'Welcome back!',
                  style: CustomTextStyle.customTextStyle,
                ),
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height: 20,
              child: Center(
                child: Text(
                  'Here is your profile data:',
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
              child: Column(children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  child: const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )),
                ),
                IgnorePointer(
                  child: TextField(
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        hintText: currentUser!.email.toString(),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                    obscureText: true,
                  ),
                ),
                addVerticalSpace(20),
                Container(
                  alignment: Alignment.topLeft,
                  child: const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Address',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )),
                ),
                IgnorePointer(
                  child: TextField(
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        hintText: userAddress,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                    obscureText: true,
                  ),
                ),
                addVerticalSpace(260),
              ]),
            )
          ]
          ),
        )
    );
  }
}
