import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:math/Screens/SignUp.dart';
import 'role.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math/Services/AuthService.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _userNameTextController.dispose();
    super.dispose();
  }

  final AuthService _auth = AuthService();
  void signin({required String email, required String password}) {
    _auth.signin(context: context, email: email, password: password);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Image.asset('images/login.png'),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.091,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color.fromARGB(255, 243, 10, 45),
          ),
          height: MediaQuery.of(context).size.height * 0.55,
          width: MediaQuery.of(context).size.height * 0.50,
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Text(
                "Welcome",
                style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 254, 250, 224),
                    fontSize: 40),
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
                  Get.off(() => const Role());
                },

                ///() async {
                //   signin(
                //       email: _emailTextController.text,
                //       password: _passwordTextController.text);
                // },
                child: Text(
                  "Login",
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 243, 10, 45),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 254, 250, 224),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.010,
              ),
              forgetPassword(context),
              TextButton(
                  child: Text(
                    "Don’t have an account? Sign up now.",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: const Color.fromARGB(255, 254, 250, 224),
                    ),
                  ),
                  onPressed: () {
                    Get.to(const SignUp());
                  })
            ],
          ),
        ),
      ]),
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
          child: const Text(
            "Forgot Password?",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          onPressed: () => Get.to(() => const Login())),
    );
  }
}
