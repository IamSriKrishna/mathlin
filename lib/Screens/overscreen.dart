
import 'package:flutter/material.dart';
import 'package:math/Screens/login.dart';

class OverScreen extends StatefulWidget {
  const OverScreen({super.key});

  @override
  State<OverScreen> createState() => _OverScreenState();
}

class _OverScreenState extends State<OverScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color.fromARGB(255, 254, 250, 224), body: Login());
  }
}
