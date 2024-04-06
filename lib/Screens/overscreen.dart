import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:math/Screens/login.dart';
import 'package:google_fonts/google_fonts.dart';

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
