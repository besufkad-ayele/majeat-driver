import 'package:flutter/material.dart';

class CustomInkwell extends StatelessWidget {
  const CustomInkwell({super.key, required this.onTap, required this.child});
  final void Function()? onTap;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onTap, child: child);
  }
}
