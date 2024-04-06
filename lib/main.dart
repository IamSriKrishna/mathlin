import 'package:flutter/material.dart';
import 'package:math/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyADgLz63cCjgGRTRAZqJYF7hsvR2zg8kQY",
          appId: '1:711832328176:android:ff9ececba7a1e6c29b2f35',
          messagingSenderId:
              '711832328176-conougvvogki37qoqltlhjdlmvv35slm.apps.googleusercontent.com',
          projectId: 'get-in-1a288'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
