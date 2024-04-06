import 'package:flutter/material.dart';

class MapCustomAppBar extends StatelessWidget {
  const MapCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: const Color.fromRGBO(254, 250, 224, 1),
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
