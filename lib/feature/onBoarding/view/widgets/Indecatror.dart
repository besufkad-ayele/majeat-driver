
import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final int positionIndex, currentIndex;
  const Indicator({super.key, required this.currentIndex, required this.positionIndex});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      width: 12,
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 243, 212, 33)),
          color:
              positionIndex == currentIndex ? const Color.fromARGB(255, 243, 166, 33) : Colors.transparent,
          borderRadius: BorderRadius.circular(100)),
    );
  }
}
