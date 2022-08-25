import 'package:flutter/material.dart';

class WeatherBackground extends StatelessWidget {
  final double diemnsion;
  final String image;

  const WeatherBackground(
      {super.key, required this.diemnsion, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: diemnsion,
      height: diemnsion,
      child: Image.asset(image),
    );
  }
}
