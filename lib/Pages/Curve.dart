import 'package:flutter/material.dart';

class Curve extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width * 0.75, 0);
    var firstControllerPoint = Offset(size.width * 0.80, size.height * 0.05);
    var secondControllerPoint = Offset(size.width * 0.88, size.height * 0.10);
    var thirdControllerPoint = Offset(size.width * 0.95, size.height * 0.15);
    path.quadraticBezierTo(firstControllerPoint.dx, firstControllerPoint.dy,
        secondControllerPoint.dx, secondControllerPoint.dy);

    path.lineTo(size.width, size.height * 0.20);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    throw UnimplementedError();
  }
}
