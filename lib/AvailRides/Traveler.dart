import 'package:firebase_auth/firebase_auth.dart';
import 'package:math/Rides/riderverif.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class Traveller extends StatefulWidget {
  const Traveller({super.key});
  static String verify = "";

  @override
  State<Traveller> createState() => _TravellerState();
}

class _TravellerState extends State<Traveller> {
  DateTime selectedDate = DateTime.now();
  TextEditingController countryCode = TextEditingController();
  TextEditingController _username = TextEditingController();
  String phone = "";

  void initState() {
    // TODO: implement initState
    countryCode.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 250, 224),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: const Color.fromARGB(255, 217, 4, 41),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text(
              "PASSENGER DETAILS",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 217, 4, 41),
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
            )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            Text(
              "Username",
              style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 217, 4, 41), fontSize: 25),
            ),
            TextField(
              controller: _username,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  AntDesign.user_outline,
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
              "Phone Number",
              style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 217, 4, 41), fontSize: 25),
            ),
            TextField(
              onChanged: (value) {
                phone = value;
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  AntDesign.phone_outline,
                  color: Colors.white,
                ),
                filled: true,
                fillColor: const Color.fromARGB(54, 217, 4, 39),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.40,
                  maxWidth: MediaQuery.of(context).size.height * 0.45,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Row(
              children: <Widget>[
                Text(
                  "D.O.B",
                  style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 217, 4, 41),
                      fontSize: 27),
                ),
                const SizedBox(
                  width: 20,
                ),
                Card.filled(
                    color: const Color.fromARGB(255, 217, 4, 41),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        textAlign: TextAlign.justify,
                        "${selectedDate.toLocal()}".split(' ')[0],
                        style: GoogleFonts.poppins(
                          fontSize: 25,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    )
                    // ),,
                    ),
                // Text(
                //   textAlign: TextAlign.justify,
                //   "${selectedDate.toLocal()}".split(' ')[0],
                //   style: GoogleFonts.poppins(
                //     fontSize: 25,
                //     color: const Color.fromARGB(255, 217, 4, 39),
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),
                IconButton(
                    onPressed: () => _selectDate(context),
                    icon: const Icon(
                      Icons.calendar_month,
                      size: 45,
                      color: Color.fromARGB(255, 217, 4, 41),
                    ))
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 110),
              child: ElevatedButton.icon(
                  onPressed: () async {
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: '${countryCode.text + phone}',
                      verificationCompleted:
                          (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {
                        Traveller.verify = verificationId;
                        Get.to(()=>MyVerify(verifyId:verificationId));
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                  },
                  icon: const Icon(
                    Icons.domain_verification,
                    color: Color.fromARGB(255, 254, 250, 224),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 217, 4, 41),
                  ),
                  label: Text(
                    "Verify",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: const Color.fromARGB(255, 254, 250, 224),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(1980),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}
