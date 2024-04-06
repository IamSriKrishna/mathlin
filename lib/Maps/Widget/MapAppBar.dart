import 'package:flutter/material.dart';

class MapCustomAppBar extends StatelessWidget {
  final String text;
  const MapCustomAppBar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: const Color.fromRGBO(254, 250, 224, 1),
      title: Text(
        text,
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      leading: Image.asset("images/logo.png"),
      actions: [
        Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage("images/dp.png"))),
        )
      ],
    );
  }
}
