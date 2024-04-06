import 'package:flutter/material.dart';

class MainTextField extends StatelessWidget {
  final TextEditingController pickup;
  final TextEditingController drop;
  const MainTextField({super.key,required this.drop,required this.pickup});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: pickup,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintStyle: const TextStyle(color: Colors.black),
                  hintText: 'Pick Up Location',
                  prefixIcon: const Icon(
                    Icons.location_on_outlined,
                    color: Colors.red,
                  )),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: drop,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintStyle: const TextStyle(color: Colors.black),
                  hintText: 'Drop Location',
                  prefixIcon: const Icon(
                    Icons.location_on_outlined,
                    color: Colors.black,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
