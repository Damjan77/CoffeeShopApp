import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "loginScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  bool loginFail = false;
  bool passwordError = false;
  bool emailError = false;
  String loginErrorMessage = "";

  // void _signIn() async{
  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: _emailTextController.text,
  //         password: _passwordTextController.text)
  //         .then((value) {
  //       print("User signed in");
  //       Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
  //     });
  //   } on FirebaseAuthException catch (e){
  //     print("ERROR HERE");
  //     print(e.message);
  //     loginFail = true;
  //     loginErrorMessage = e.message!;
  //
  //     if(loginErrorMessage == "There is no user record corresponding to this identifier. The user may have been deleted."){
  //       emailError = true;
  //       loginErrorMessage = "User doesn't exist, please create an account";
  //     }else {
  //       passwordError = true;
  //       loginErrorMessage = "Incorrect password";
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          // alignment: Alignment.center,
        //     decoration: BoxDecoration(gradient: LinearGradient(colors: [
        //       hexStringToColor("CB2B93"),
        //       hexStringToColor("9546C4"),
        //       hexStringToColor("5E61F4"),
        //     ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
        //     ),
        //     child: Padding(
        //         padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height*0.1, 20, 0),
        //         child: Column(
        //             children: <Widget>[
        //               SizedBox(height: 40),
        //               Text("Welcome to my App", style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold, fontSize: 28),),
        //               SizedBox(height: 40),
        //               TextField(
        //                 controller: _emailTextController,
        //                 textInputAction: TextInputAction.next,
        //                 decoration: InputDecoration(
        //                     labelText: "Email",
        //                     errorText: emailError ? loginErrorMessage : null
        //                 ),
        //               ),
        //               SizedBox(height: 40),
        //               TextField(
        //                 controller: _passwordTextController,
        //                 textInputAction: TextInputAction.done,
        //                 decoration: InputDecoration(
        //                     labelText: "Password",
        //                     errorText: passwordError ? loginErrorMessage : null
        //                 ),
        //                 obscureText: true,
        //               ),
        //               SizedBox(height: 20),
        //               ElevatedButton.icon(
        //                 style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
        //                 icon: Icon(Icons.lock_open_rounded, size: 32,),
        //                 label: Text("Sign In", style: TextStyle(fontSize: 24),),
        //                 onPressed: _signIn,
        //               ),
        //               SizedBox(height: 20),
        //               signUpOption()
        //             ]
        //         )
        //     )
            )
    );
  }
  // Row signUpOption(){
  //   return Row(mainAxisAlignment: MainAxisAlignment.center,
  //     children: [const Text("Don't have account?",
  //       style: TextStyle(color: Colors.black87),
  //     ),
  //       GestureDetector(
  //         onTap: (){
  //           Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen())
  //           );
  //         },
  //         child: const Text(
  //           " Sign Up",
  //           style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
  //         ),
  //       )
  //     ],
  //   );
  // }
}
