import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../config/colors.dart';
import '../models/weather.dart';

class SunriseSunset extends StatelessWidget {
  final Weather weather;

  const SunriseSunset({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      height: 110,
      child: Stack(
        children: [
          Positioned(
            left: 5,
            bottom: MediaQuery.of(context).size.height * 0.06,
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  margin:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 4),
                  child: Image.asset('assets/images/sun.png'),
                ),
                Text(
                  DateFormat.jm().format(
                      weather.sunriseTime!.add(const Duration(hours: 2))),
                  style: GoogleFonts.lato(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.myWhite,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * -0.001,
            right: 5,
            child: Row(
              children: [
                Text(
                  DateFormat.jm().format(
                      weather.sunsetTime!.add(const Duration(hours: 2))),
                  style: GoogleFonts.lato(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.myWhite,
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  margin:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 4),
                  child: Image.asset('assets/images/moon.png'),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/images/Line.png'),
          ),
        ],
      ),
    );
  }
}
