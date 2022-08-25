import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../config/colors.dart';
import '../models/weather.dart';
import '../services/weather_code.dart';

class WeatherList1d extends StatelessWidget {
  final List<Weather> weatherList;
  const WeatherList1d({super.key, required this.weatherList});

  @override
  Widget build(BuildContext context) {
    Widget _buildWeatherItem(int index) {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: MediaQuery.of(context).size.height * 0.006),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('EEEE, MMM d')
                      .format(weatherList[index].startTime ?? DateTime.now()),
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.myWhite,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 2),
                  child: Text(
                    WeatherCode.getStatus(weatherList[index].weatherCode ?? 0),
                    style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.myWhite,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  margin:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 30),
                  child: Image.asset(WeatherCode.getImage1d(
                      weatherList[index].weatherCode ?? 0,
                      weatherList[index].startTime ?? DateTime.now())),
                ),
                Text(
                  '${weatherList[index].temperature.toString()} °',
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.myWhite,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Expanded(
      flex: 4 + (MediaQuery.of(context).size.height * 0.0023).toInt(),
      child: ListView.builder(
        itemCount: (weatherList.length >= 14) ? 14 : weatherList.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return _buildWeatherItem(index);
        },
      ),
    );
  }
}
