import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../config/colors.dart';
import '../models/weather.dart';
import '../services/weather_code.dart';

class WeatherList1h extends StatelessWidget {
  final List<Weather> weatherList;

  const WeatherList1h({super.key, required this.weatherList});

  @override
  Widget build(BuildContext context) {
    Widget _buildWeatherItem(int index) {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.056),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormat.j()
                  .format(weatherList[index].startTime ?? DateTime.now()),
              style: GoogleFonts.lato(
                fontSize: 13,
                color: AppColors.myWhite,
              ),
            ),
            Container(
              width: 28,
              height: 28,
              margin: const EdgeInsets.symmetric(vertical: 13),
              child: Image.asset(WeatherCode.getImage1h(
                  weatherList[index].weatherCode ?? 0,
                  weatherList[index].startTime ?? DateTime.now())),
            ),
            Container(
              margin: const EdgeInsets.only(left: 4),
              child: Text(
                '${weatherList[index].temperature.toString()} °',
                style: GoogleFonts.lato(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: AppColors.myWhite,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Expanded(
      flex: 3,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: ListView.builder(
          itemCount: (weatherList.length >= 13) ? 13 : weatherList.length,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return _buildWeatherItem(index);
          },
        ),
      ),
    );
  }
}
