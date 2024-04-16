import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  const CustomBox({super.key, this.height, this.width, this.color, this.gradient, this.child, required this.borderRadius, required this.padding, this.border});
  final double? height;
  final double? width;
  final Color? color;
  final Gradient? gradient;
  final Widget? child;
  final double borderRadius;
  final double padding;
  final Border? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        gradient: gradient,
        borderRadius: BorderRadius.circular(borderRadius),
        border: border,
      ),
      padding: EdgeInsets.all(padding),
      child: child,
    );
  }
}