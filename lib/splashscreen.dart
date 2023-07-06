import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Center(
                child: Lottie.asset(
                    'animations/95892-merch-stores-imprint-genius.json',
                    height: 250,
                    repeat: true,
                    reverse: true,
                    fit: BoxFit.cover),
              ),
              SizedBox(
                height: 30,
              ),
              AnimatedTextKit(animatedTexts: [
                TypewriterAnimatedText('Welcome',
                    textStyle:
                        TextStyle(color: Color(0xFF004096), fontSize: 25),
                    speed: Duration(milliseconds: 100)),
                TypewriterAnimatedText('To',
                    textStyle:
                        TextStyle(color: Color(0xFF004096), fontSize: 25),
                    speed: Duration(milliseconds: 100)),
                TypewriterAnimatedText('NFC IET',
                    textStyle:
                        TextStyle(color: Color(0xFF004096), fontSize: 25),
                    speed: Duration(milliseconds: 100)),
                TypewriterAnimatedText('Inventory Management System',
                    textStyle:
                        TextStyle(color: Color(0xFF004096), fontSize: 25),
                    speed: Duration(milliseconds: 100)),
              ]),
              SizedBox(
                height: 130,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF004096),
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
