import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<InfoScreen> {
  TextEditingController controller = TextEditingController();

  _InfoState();

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
      ),
      body: Container(
          alignment: Alignment.center,
          //decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
          child: Padding(
              padding: EdgeInsets.fromLTRB(
                  20, MediaQuery.of(context).size.height * 0.07, 20, 0),
              child: Column(children: <Widget>[
                const Text(
                  "Scan for more info",
                  style: TextStyle(
                      color: Color(0xFF7B5B36),
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
                SizedBox(height: 40),
                QrImage(
                  data:
                      "https://yourcoffeeandtea.com/different-types-of-coffee/?fbclid=IwAR0tVe1EJTRCvCgdz7DPp-oCbHTkufNFVCqrgFlaiTFbi0ZjTw69-cB2BjI",
                  size: 250,
                  gapless: true,
                  version: QrVersions.auto,
                  foregroundColor: const Color(0xFF7B5B36),
                  backgroundColor: const Color(0xFFFFFFFF),
                  eyeStyle: const QrEyeStyle(eyeShape: QrEyeShape.circle),
                ),
                SizedBox(height: 50),
                const Text(
                  "Check out more info on the types of coffee we deliver and order your favorite",
                  style: TextStyle(
                      color: Color(0xFF9D622B),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ]))),
    );
  }
}
