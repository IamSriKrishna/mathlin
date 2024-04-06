import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:math/Screens/role.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 250, 224),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
          ),
          Image.asset(
            'images/signup.png',
            width: 250,
            height: 250,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.141,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color.fromARGB(255, 243, 10, 45),
            ),
            height: MediaQuery.of(context).size.height * 0.50,
            width: MediaQuery.of(context).size.height * 0.50,
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Get Started!",
                  style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 254, 250, 224),
                      fontSize: 40),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                TextField(
                  controller: _emailTextController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 254, 250, 224),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 254, 250, 224),
                            width: 10)),
                    labelText: "E-mail",
                    labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 255, 129, 120),
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.55,
                      maxWidth: MediaQuery.of(context).size.height * 0.45,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                TextField(
                  controller: _userNameTextController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 254, 250, 224),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 254, 250, 224),
                            width: 10)),
                    labelText: "Username",
                    labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 255, 129, 120), fontSize: 20),
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.55,
                      maxWidth: MediaQuery.of(context).size.height * 0.45,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                TextField(
                  controller: _passwordTextController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 254, 250, 224),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 254, 250, 224),
                            width: 10)),
                    labelText: "Password",
                    labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 255, 129, 120), fontSize: 20),
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.55,
                      maxWidth: MediaQuery.of(context).size.height * 0.45,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: _emailTextController.text,
                              password: _passwordTextController.text)
                          .then((value) {
                        print("Created New Account");
                        Get.off(() => Role());
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(140, 251, 251, 251)),
                    child: Text("Sign Up",
                        style: GoogleFonts.poppins(
                            color: const Color.fromARGB(255, 254, 250, 224),
                            fontSize: 20))),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.010,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
