import 'package:flutter/material.dart';
import 'package:math/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCKMwy_lONSMb18oLPVRGwOydbBYfs64oI",
          appId: '1:208580287480:android:f7db3fc96c66c07810940d',
          messagingSenderId:
              '208580287480',
          projectId: 'math-2-e7f8e'));
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
