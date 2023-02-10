import 'package:coffe_shop_app/screens/google_map_screen.dart';
import 'package:coffe_shop_app/screens/home_screen.dart';
import 'package:coffe_shop_app/screens/login_screen.dart';
import 'package:coffe_shop_app/screens/register_screen.dart';
import 'package:coffe_shop_app/screens/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Shop App',
      theme: Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: const Color(0xFF7B5B36),
        ),
      ),
      initialRoute: MapScreen.idScreen,
      routes: {
        SplashScr.idScreen:(context) => SplashScr(),
        LoginScreen.idScreen:(context) => LoginScreen(),
        RegisterScreen.idScreen:(context) => RegisterScreen(),
        HomeScreen.idScreen:(context) => HomeScreen(),
        MapScreen.idScreen:(context) => MapScreen(),
      },
    );
  }
}
