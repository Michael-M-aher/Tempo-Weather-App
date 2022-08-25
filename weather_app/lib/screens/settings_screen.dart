import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/cubit/weather_cubit.dart';
import '../config/colors.dart';
import '../config/strings.dart';
import '../models/weather.dart';
import '../services/shared_prefs.dart';
import '../widgets/loading_widget.dart';
import '../widgets/setting_weather_card.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Weather weather = Weather();
  bool isLoaded = false;
  String dropdownvaluetemp = sharedPrefs.tempUnit;
  String dropdownvaluewind = sharedPrefs.windSpeedUnit;
  String address = sharedPrefs.getFullAddress();
  late StreamSubscription subscription;

  @override
  void initState() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result != ConnectivityResult.none) {
        Navigator.pushReplacementNamed(context, settingsScreen);
      }
    });
    BlocProvider.of<WeatherCubit>(context).getWeather();
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
    subscription.cancel();
  }

  var itemstemp = [
    'Celcius',
    'Fehrenhite',
  ];

  var itemswind = [
    'm/s',
    'mph',
  ];

  Widget _buildSettingsCard() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 34),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Temprature',
                  style: GoogleFonts.lato(fontSize: 18, color: Colors.white),
                ),
                DropdownButton(
                  value: dropdownvaluetemp,
                  underline: const SizedBox(),
                  dropdownColor: AppColors.myDarkBlue,
                  icon: const Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: Colors.white70,
                  ),
                  items: itemstemp.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(
                        items,
                        style: GoogleFonts.lato(
                            fontSize: 18, color: AppColors.myGreyText),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvaluetemp = newValue!;
                      sharedPrefs.tempUnit = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 34),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Wind Speed',
                  style: GoogleFonts.lato(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                DropdownButton(
                  value: dropdownvaluewind,
                  underline: const SizedBox(),
                  dropdownColor: AppColors.myDarkBlue,
                  icon: const Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: Colors.white70,
                  ),
                  items: itemswind.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 28),
                        child: Text(
                          items,
                          style: GoogleFonts.lato(
                              fontSize: 18,
                              color: AppColors.myGreyText,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvaluewind = newValue!;
                      sharedPrefs.windSpeedUnit = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationButton() {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, mapScreen);
      },
      child: Text(
        'Change default location',
        style: GoogleFonts.lato(
          fontSize: 18,
          color: AppColors.mycyan,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WeatherCubit, WeatherState>(
      listener: (context, state) {
        if (state is WeatherLoaded) {
          weather = state.weather;
          setState(() {
            isLoaded = true;
          });
        }
      },
      child: (isLoaded)
          ? Column(
              children: [
                SettingsWeatherCard(
                  weather: weather,
                ),
                _buildSettingsCard(),
                _buildLocationButton(),
              ],
            )
          : const LoadingWidget(),
    );
  }
}
