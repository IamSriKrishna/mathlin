import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math/AvailRides/Traveler.dart';
import 'package:math/Rides/riderdet.dart';

import 'package:google_fonts/google_fonts.dart';

class Role extends StatelessWidget {
  const Role({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 250, 224),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: const Color.fromARGB(255, 217, 4, 41),
        centerTitle: true,
        title: Text(
          "CHOOSE YOUR ROLE",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 217, 4, 41),
              fontSize: 25,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => const RiderDetails());
            },
            child: Center(
              child: Card.filled(
                color: const Color.fromARGB(78, 209, 97, 116),
                child: Column(
                  children: [
                    Image.asset('images/scooter.png', width: 200, height: 200),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text("Post a Ride",
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w700))
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => const Traveller());
            },
            child: Center(
              child: Card.filled(
                color: const Color.fromARGB(74, 209, 97, 116),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(
                        'images/helmet.png',
                        width: 180,
                        height: 180,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text("Available Rides",
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w700))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
