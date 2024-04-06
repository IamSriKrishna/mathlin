import 'package:flutter/material.dart';
import 'package:math/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAA7m_fEkTtwiHeqojgyDJ9P31qzosB0x4",
          appId: '1:633074746296:android:f3a117184a9ee87876c54d',
          messagingSenderId:
              '633074746296',
          projectId: 'math-50d12'));
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
