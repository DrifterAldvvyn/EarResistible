import 'package:flutter/material.dart';
import 'dart:math';

class HomePageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    // Starting Point
    path.lineTo(0.0, size.height * 0.4);
    
    List<Offset> points = [
      Offset(size.width * 0.11, size.height * 0.4),
      Offset(size.width * 0.33, size.height * 0.6),
      Offset(size.width * 0.55, size.height * 0.6),
      Offset(size.width * 0.76, size.height * 0.2),
      Offset(size.width, size.height),
      Offset(size.width, size.height),
    ];
    
    for (int i = 0; i < points.length - 1; i++) {
      Offset mid = Offset(
      (points[i].dx + points[i + 1].dx) / 2,
      (points[i].dy + points[i + 1].dy) / 2,
      );
      path.quadraticBezierTo(points[i].dx, points[i].dy, mid.dx, mid.dy);
    }

    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(HomePageClipper oldClipper) => 
  oldClipper != this;
}

class AboutPageClipper extends CustomClipper<Path> {
  final double scrollOffset;
  AboutPageClipper({required this.scrollOffset});
  
  @override
  Path getClip(Size size) {
    var path = Path();
    double dynamicFactor = (scrollOffset / 400);
    // Starting Point
    path.lineTo(0.0, size.height * max(0.4, 0.9 - dynamicFactor));
    
    List<Offset> points = [
      Offset(0.0, size.height * max(0.47, 0.9 - dynamicFactor)),
      Offset(size.width * 0.11, size.height * max(0.5, 0.9 - dynamicFactor)),
      Offset(size.width * 0.33, size.height * max(0.5, 1.0 - dynamicFactor)),
      Offset(size.width * 0.55, size.height * max(0.5, 1.0 - dynamicFactor)),
      Offset(size.width * 0.76, size.height * max(0.5, 0.8 - dynamicFactor)),
      Offset(size.width, size.height * max(0.5, 1.0 - dynamicFactor)),
      Offset(size.width, size.height * max(0.3, 1.0 - dynamicFactor)),
    ];
    
    for (int i = 0; i < points.length - 1; i++) {
      Offset mid = Offset(
      (points[i].dx + points[i + 1].dx) / 2,
      (points[i].dy + points[i + 1].dy) / 2,
      );
      path.quadraticBezierTo(points[i].dx, points[i].dy, mid.dx, mid.dy);
    }

    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(AboutPageClipper oldClipper) => 
  oldClipper != this;
}