import 'package:flutter/material.dart';
import 'dart:ui';

class BlurredContainer extends StatelessWidget {
  final Widget child;
  final double blurX;
  final double blurY;
  final double? width;
  final double? height;
  final double borderRadius;
  final Color backgroundColor;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxDecoration? decoration;

  const BlurredContainer({
    super.key,
    required this.child,
    this.blurX = 1.0,
    this.blurY = 1.0,
    this.borderRadius = 15.0,
    this.width,
    this.height,
    this.backgroundColor = Colors.white24,
    this.constraints,
    this.padding,
    this.margin,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      padding: padding,
      constraints: constraints,
      decoration: decoration ??
          BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: Colors.white.withOpacity(0.3)),
          ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurX, sigmaY: blurY),
          child: Container(
            color: backgroundColor.withOpacity(0.1),
            child: child,
          ),
        ),
      ),
    );
  }
}
