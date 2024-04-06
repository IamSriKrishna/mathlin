import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:math/Maps/MapScreen.dart';
import 'package:math/Payment/Payment.dart';
import 'package:math/PreBooking/PreBooking.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = const [
    MapScreen(),
    PreBooking(),
    PaymentScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromRGBO(254, 250, 224, 1),
      bottomNavigationBar: CurvedNavigationBar(
        color: Color.fromRGBO(217, 4, 41, 1),
        height: MediaQuery.of(context).size.height*0.06,
        backgroundColor: Colors.transparent,
        index: _currentIndex,
        items: const[
          Icon(Icons.home, size: 30,color: Colors.black,),
          Icon(Icons.list, size: 30,color: Colors.black,),
          Icon(Icons.compare_arrows, size: 30,color: Colors.black,),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: _screens[_currentIndex],
    );
  }
}
