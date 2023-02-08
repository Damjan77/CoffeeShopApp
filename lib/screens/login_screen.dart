import 'package:coffe_shop_app/screens/home_screen.dart';
import 'package:coffe_shop_app/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String idScreen = "loginScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  bool loginFail = false;
  bool passwordError = false;
  bool emailError = false;
  String loginErrorMessage = "test";

  Future _signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text, 
        password: _passwordController.text)
        .then((value) {
          print("User signed in");
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        });
    } on FirebaseAuthException catch (e){
        print("ERROR HERE");
        print(e.message);
        loginFail = true;
        loginErrorMessage = e.message!;

        if(loginErrorMessage == "There is no user record corresponding to this identifier. The user may have been deleted."){
          emailError = true;
          loginErrorMessage = "User does not exist, please create an account";
        }else {
          passwordError = true;
          loginErrorMessage = "Incorrect password";
        }
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
              Text("Login", style: TextStyle(color: Color(0xFF7B5B36), fontWeight: FontWeight.bold, fontSize: 30),),
              SizedBox(height: 20),
              TextField(
                controller: _emailController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: "Email",
                  errorText: emailError ? loginErrorMessage : null,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: "Password",
                  errorText: passwordError ? loginErrorMessage : null,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  )
                ),
                label: Text("Sign In", style: TextStyle(fontSize: 24),),
                icon: Icon(Icons.lock_open, size: 25,),
                onPressed: _signIn,
                ),
              SizedBox(height: 20),
              signUpOption()
              ]
            )
          )
            )
    );
  }
  Row signUpOption(){
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [const Text("Don't have account?",
        style: TextStyle(color: Colors.black87),
      ),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen())
            );
          },
          child: const Text(
            " Register",
            style: TextStyle(color: Color(0xFF7B5B36), fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
