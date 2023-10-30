
import 'package:flutter/material.dart';

class Traingle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width * 0.4, -size.height * 0.2);
    path.lineTo(0, size.height);
    path.lineTo(size.width + 40, size.height * 0.3);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<dynamic> oldClipper) => true;
}