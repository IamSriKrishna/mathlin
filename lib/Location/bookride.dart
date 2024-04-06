
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:math/Screens/MainScreen.dart';

class BookRide extends StatefulWidget {
  const BookRide({super.key});

  @override
  State<BookRide> createState() => _BookRideState();
}

class _BookRideState extends State<BookRide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 250, 224),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              "Vehicle Details",
              style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 217, 41, 4), fontSize: 30),
            ),
            Text(
              "Vehicle Brand",
              style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 217, 4, 41), fontSize: 25),
            ),
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  AntDesign.number_outline,
                  color: Colors.white,
                ),
                filled: true,
                fillColor: const Color.fromARGB(54, 217, 4, 39),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.25,
                  maxWidth: MediaQuery.of(context).size.height * 0.45,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            Text(
              "Vehicle Model",
              style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 217, 4, 41), fontSize: 25),
            ),
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  AntDesign.number_outline,
                  color: Colors.white,
                ),
                filled: true,
                fillColor: const Color.fromARGB(54, 217, 4, 39),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.25,
                  maxWidth: MediaQuery.of(context).size.height * 0.45,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            Text(
              "Vehicle Number",
              style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 217, 4, 41), fontSize: 25),
            ),
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  AntDesign.number_outline,
                  color: Colors.white,
                ),
                filled: true,
                fillColor: const Color.fromARGB(54, 217, 4, 39),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.25,
                  maxWidth: MediaQuery.of(context).size.height * 0.45,
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(()=>MainScreen());
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 217, 4, 41)),
                child: Text(
                  "Confirm",
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 254, 250, 224),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
