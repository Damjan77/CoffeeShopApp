import 'package:coffe_shop_app/view/home_screen.dart';
import 'package:coffe_shop_app/view/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static const String idScreen = "registerScreen";

   @override
 _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>{

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();


 Future _signUp() async{
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text, 
        password: passwordController.text)
        .then((value) {
          print("Created new account");
          final FirebaseAuth auth = FirebaseAuth.instance;
          final User? user = auth.currentUser;
          final uid = user?.uid;

          FirebaseFirestore.instance.collection("Users").doc(uid).set({
            'uid': uid,
            'address': addressController.text
          });
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
        });
    } on FirebaseAuthException catch (e){
        print("ERROR HERE");
        print(e.message);

        showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Error"),
              content: Text("All fields are required."),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  child: Text("OK"),
                )
              ],
            )
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFFFEFC7),
      body: Container(
        alignment: Alignment.center,
        child: Padding(
            padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height*0.1, 20, 0),
            child: Column(
            children: <Widget>[
              Image.asset('assets/images/logo.png', height: 200,),
              Text("Register", style: TextStyle(color: Color(0xFF7B5B36), fontWeight: FontWeight.bold, fontSize: 30),),
              SizedBox(height: 20),
              TextField(
                controller: emailController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
              ),
              SizedBox(height: 20),
              TextField(
                controller: passwordController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
                obscureText: true,
              ),
              SizedBox(height: 20),
              TextField(
                controller: addressController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: "Address",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0))),
                icon: Icon(Icons.lock_open, size: 25,),
                label: Text("Register", style: TextStyle(fontSize: 24),),
                onPressed: _signUp,
                ),
                SizedBox(height: 20),
                signInOption()
              ]
            )
          )
        )
    );
  }

  Row signInOption(){
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [const Text("Already have an account?",
        style: TextStyle(color: Colors.black87),
      ),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen())
            );
          },
          child: const Text(
            " Login",
            style: TextStyle(color: Color(0xFF7B5B36), fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}