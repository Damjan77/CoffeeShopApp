import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_shop_app/camera/preview_page.dart';
import 'package:coffe_shop_app/custom/custom_app_bar.dart';
import 'package:coffe_shop_app/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen();

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
  _ProfileState();

  late String userAddress = '';
  var currentUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    getUserAddress();
  }

  Future _signOut() async {
    try {
      await FirebaseAuth.instance.signOut().then((value) {
        print("User signed out");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    } on FirebaseAuthException catch (e) {
      print("ERROR HERE");
      print(e.message);
    }
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0),
              child: FloatingActionButton.extended(
                heroTag: 'btn1',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (_) => PreviewPage()));
                },
                backgroundColor: Color(0xFF7B5B36),
                label: Text("OPEN IMAGE GALLERY"),
                icon: Icon(Icons.camera),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton.extended(
                heroTag: 'btn2',
                onPressed: _signOut,
                backgroundColor: const Color(0xFF7B5B36),
                label: Text("LOGOUT"),
                icon: Icon(Icons.logout_rounded),
              ),
            )
          ],
        ),

        backgroundColor: const Color(0xFFFCF5C9),
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
                  style: TextStyle(
                      color: Color(0xFF7B5B36),
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
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
                    color: Color(0xFF7B5B36),
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
                const SizedBox(height: 20),
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
                const SizedBox(
                  height: 260,
                ),
              ]),
            )
          ]
          ),
        )
    );
  }
}
