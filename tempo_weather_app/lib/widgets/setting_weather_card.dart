import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/colors.dart';
import '../models/weather.dart';
import '../services/shared_prefs.dart';
import '../services/weather_code.dart';
import 'weather_background.dart';
import 'weather_data_row.dart';

class SettingsWeatherCard extends StatelessWidget {
  final Weather weather;

  const SettingsWeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    Widget buildWeatherDataCol() {
      return Column(
        children: [
          Text(
            sharedPrefs.getFullAddress(),
            style: GoogleFonts.lato(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColors.myWhite),
            textAlign: TextAlign.center,
          ),
          WeatherBackground(
            diemnsion: width * 0.33 > 150 ? 150 : width * 0.33,
            image: WeatherCode.getBackgroundImage(
              weather.weatherCode ?? 0,
              weather.startTime ?? DateTime.now(),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 13),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: AppColors.myPurple,
            ),
            child: Text(
              WeatherCode.getStatus(weather.weatherCode ?? 0),
              style: GoogleFonts.lato(
                fontSize: 18,
                color: AppColors.myWhite,
              ),
            ),
          ),
          sharedPrefs.tempUnit == 'Celcius'
              ? Container(
                  margin: const EdgeInsets.symmetric(vertical: 13),
                  child: Text(
                    '${weather.temperature.toString()} °C',
                    style: GoogleFonts.lato(
                        fontSize: height * 0.06,
                        fontWeight: FontWeight.bold,
                        color: AppColors.myWhite),
                  ),
                )
              : Container(
                  margin: const EdgeInsets.symmetric(vertical: 13),
                  child: Text(
                    '${(weather.temperature! * (9 / 5) + 32).toStringAsFixed(1)} °F',
                    style: GoogleFonts.lato(
                        fontSize: height * 0.06,
                        fontWeight: FontWeight.bold,
                        color: AppColors.myWhite),
                  ),
                ),
        ],
      );
    }

    Widget buildWeatherDataRow() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
        child: WeatherDataRow(weather: weather),
      );
    }

    Widget buildLocationLabel() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.my_location_outlined,
              color: AppColors.myGrey,
              size: 18,
            ),
            Text(
              '  Your Default Location',
              style: GoogleFonts.lato(fontSize: 18, color: AppColors.myGrey),
            ),
          ],
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          buildLocationLabel(),
          buildWeatherDataCol(),
          buildWeatherDataRow(),
        ],
      ),
    );
  }
}
