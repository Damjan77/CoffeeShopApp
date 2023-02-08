import 'package:coffe_shop_app/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class HomeScreen extends StatefulWidget {
  static const String idScreen = "homeScreen";

   @override
 _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  late String userAddress;
 
@override
void initState() {
  super.initState();
  getUserAddress();
}

// for getting user address
Future getUserAddress() async {
  await FirebaseFirestore.instance.collection("Users")
    .doc(FirebaseAuth.instance.currentUser!.uid)
    .get()
    .then((snapshot) async {
      if(snapshot.exists) {
        setState(() {
          userAddress = snapshot.data()!["address"];
          print(userAddress);
        });
      }
    });
}

Future _signOut() async{
    try {
      await FirebaseAuth.instance.signOut().then((value) {
        print("User signed out");
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    } on FirebaseAuthException catch (e){
        print("ERROR HERE");
        print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: _signOut,
          label: Text("Sign out"),
          backgroundColor: Color(0xFF7B5B36),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(),
      body: Container(),
    );
  }
}