import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../config/colors.dart';
import '../models/weather.dart';
import '../services/shared_prefs.dart';
import '../services/weather_code.dart';
import 'weather_background.dart';
import 'weather_data_row.dart';

class WeatherCard extends StatelessWidget {
  final Weather weather;

  const WeatherCard({super.key, required this.weather});

  Widget _buildWeatherDataCol(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Text(
              sharedPrefs.getShortAddress(),
              style: GoogleFonts.lato(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  color: AppColors.myWhite),
              textAlign: TextAlign.center,
            ),
          ),
          sharedPrefs.tempUnit == 'Celcius'
              ? Container(
                  margin: const EdgeInsets.symmetric(vertical: 13),
                  child: Text(
                    '${weather.temperature.toString()} °C',
                    style: GoogleFonts.lato(
                        fontSize: 33,
                        fontWeight: FontWeight.w400,
                        color: AppColors.myWhite),
                  ),
                )
              : Container(
                  margin: const EdgeInsets.symmetric(vertical: 13),
                  child: Text(
                    '${(weather.temperature! * (9 / 5) + 32).toStringAsFixed(1)} °F',
                    style: GoogleFonts.lato(
                        fontSize: 33,
                        fontWeight: FontWeight.w400,
                        color: AppColors.myWhite),
                  ),
                ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: AppColors.myPurple,
            ),
            child: Text(
              WeatherCode.getStatus(weather.weatherCode ?? 0),
              style: GoogleFonts.lato(
                fontSize: 16,
                color: AppColors.myWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherDataRow(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: WeatherDataRow(weather: weather),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.008),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildWeatherDataCol(context),
                WeatherBackground(
                  diemnsion: 180,
                  image: WeatherCode.getBackgroundImage(
                    weather.weatherCode ?? 0,
                    weather.startTime ?? DateTime.now(),
                  ),
                ),
              ],
            ),
            _buildWeatherDataRow(context)
          ],
        ),
      ),
    );
  }
}
