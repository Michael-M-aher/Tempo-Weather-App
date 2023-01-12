import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/colors.dart';
import '../config/icons.dart';
import '../models/weather.dart';
import '../services/shared_prefs.dart';

class WeatherDataRow extends StatelessWidget {
  final Weather weather;

  const WeatherDataRow({super.key, required this.weather});

  Widget _weatherRowItem(IconData icon, String text) {
    return Row(
      children: [
        Container(
            margin: const EdgeInsets.only(right: 10),
            child: Icon(icon,
                color: AppColors.myGrey, size: icon == MyIcons.rain ? 23 : 21)),
        Text(
          text,
          style: GoogleFonts.lato(
            fontSize: 18,
            color: AppColors.myWhite,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _weatherRowItem(MyIcons.rain, '${weather.precipitation.toString()} %'),
        sharedPrefs.windSpeedUnit == 'm/s'
            ? _weatherRowItem(
                FontAwesomeIcons.wind, '${weather.windSpeed.toString()} m/s')
            : _weatherRowItem(FontAwesomeIcons.wind,
                '${(weather.windSpeed! * 2.23694).toStringAsFixed(1)} mph'),
        _weatherRowItem(
            FontAwesomeIcons.droplet, '${weather.humidity.toString()} %'),
      ],
    );
  }
}
