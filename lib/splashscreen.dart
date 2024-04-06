import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math/Screens/overscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> splashNavigateTo() async {
    await Future.delayed(Duration(seconds: 1), () {
      Get.to(OverScreen());
    });
  }

  @override
  void initState() {
    splashNavigateTo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 250, 224),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset('images/logo.png')],
        ),
      ),
    );
  }
}
