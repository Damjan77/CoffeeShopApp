import 'package:coffe_shop_app/model/coffee.dart';
import 'package:coffe_shop_app/screens/cart_screen.dart';
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

  final List<Coffee> _cartList = <Coffee>[];
  var currentUser = FirebaseAuth.instance.currentUser;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCF5C9),
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo-cropped.png',
          fit: BoxFit.contain,
          height: 60,
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 16.0, top: 12.0),
              child: GestureDetector(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    const Icon(
                      Icons.shopping_cart,
                      size: 30.0,
                    ),
                    if (_cartList.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: CircleAvatar(
                          radius: 8.0,
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          child: Text(
                            _cartList.length.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CartScreen(_cartList),
                    ),
                  );
                },
              ))
        ],
      ),
      body: Column(children: <Widget>[
        const ColoredBox(
          color:Color(0xFF7B5B36),
          child: SizedBox(
          width: double.infinity,
          height: 50,
          child: Center(
            child: Text(
            'Welcome back!',
            style: TextStyle(
                color: Color.fromARGB(255, 237, 234, 231),
                fontWeight: FontWeight.bold,
                fontSize: 20),
            ),
          ),
        ),
        ),
        const ColoredBox(
          color:Color(0xFF7B5B36),
          child: SizedBox(
          width: double.infinity,
          height: 50,
          child: Center(
            child: Text(
            'Here is your profile data:',
            style: TextStyle(
                color: Color.fromARGB(255, 237, 234, 231),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
          child: Column(children: <Widget>[
          const Text(
            'Email',
            style: TextStyle(
              fontSize: 16
            ),
          ),
          TextField(
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              hintText: currentUser!.email.toString(),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))
            ),
            obscureText: true,
          ),
          const SizedBox(
            height: 350,
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
              )
            ),
            label: const Text("Log Out", style: TextStyle(fontSize: 24),),
            icon: const Icon(Icons.logout, size: 25,),
            onPressed: _signOut,
            ),    
          ]
          ),
        )    
      ]
      )
    );
  }
}
