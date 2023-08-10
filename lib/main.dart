import 'package:coffe_shop_app/services/gallery_service.dart';
import 'package:coffe_shop_app/view/home_screen.dart';
import 'package:coffe_shop_app/view/login_screen.dart';
import 'package:coffe_shop_app/view/register_screen.dart';
import 'package:coffe_shop_app/view/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'custom/custom_box_widgets.dart';

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
          primary: primaryColor,
        ),
      ),
      initialRoute: SplashScr.idScreen,
      routes: {
        SplashScr.idScreen:(context) => SplashScr(),
        LoginScreen.idScreen:(context) => LoginScreen(),
        RegisterScreen.idScreen:(context) => RegisterScreen(),
        HomeScreen.idScreen:(context) => HomeScreen(),
        GalleryService.idScreen:(context) => GalleryService(),
      },
    );
  }
}
