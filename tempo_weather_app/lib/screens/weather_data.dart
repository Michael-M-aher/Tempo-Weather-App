import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit/weather1d_cubit.dart';
import '../bloc/cubit/weather1h_cubit.dart';
import '../bloc/cubit/weather_cubit.dart';
import '../config/strings.dart';
import '../models/weather.dart';
import '../widgets/loading_widget.dart';
import '../widgets/offline_widget.dart';
import '../widgets/sunrise_sunset.dart';
import '../widgets/today_text.dart';
import '../widgets/weather_card.dart';
import '../widgets/weather_list_1d.dart';
import '../widgets/weather_list_1h.dart';

class WeatherDataScreen extends StatefulWidget {
  const WeatherDataScreen({Key? key}) : super(key: key);

  @override
  State<WeatherDataScreen> createState() => _WeatherDataScreenState();
}

class _WeatherDataScreenState extends State<WeatherDataScreen> {
  Weather weather = Weather();
  late List<Weather> weather1h;
  late List<Weather> weather1d;
  bool isLoaded = false;
  bool is1hLoaded = false;
  bool is1dLoaded = false;
  bool offline = false;
  late StreamSubscription subscription;

  @override
  void initState() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result != ConnectivityResult.none) {
        Navigator.pushReplacementNamed(context, mainScreen);
      }
    });
    BlocProvider.of<WeatherCubit>(context).getWeather();
    BlocProvider.of<Weather1hCubit>(context).getWeather1h();
    BlocProvider.of<Weather1dCubit>(context).getWeather1d();
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<WeatherCubit, WeatherState>(
          listener: (context, state) {
            if (state is WeatherLoaded) {
              weather = state.weather;
              setState(() {
                isLoaded = true;
              });
            }
          },
        ),
        BlocListener<Weather1hCubit, Weather1hState>(
          listener: (context, state) {
            if (state is Weather1hLoaded) {
              weather1h = state.weather1h;
              (weather1h.isEmpty) ? offline = true : offline = false;
              setState(() {
                is1hLoaded = true;
              });
            }
          },
        ),
        BlocListener<Weather1dCubit, Weather1dState>(
          listener: (context, state) {
            if (state is Weather1dLoaded) {
              weather1d = state.weather1d;
              setState(() {
                is1dLoaded = true;
              });
            }
          },
        ),
      ],
      child: (is1dLoaded && is1hLoaded && is1dLoaded)
          ? (offline)
              ? const OfflineWidget()
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      WeatherCard(
                        weather: weather,
                      ),
                      if (MediaQuery.of(context).size.height >= 740)
                        SunriseSunset(weather: weather1h[0]),
                      const TodayText(),
                      WeatherList1h(weatherList: weather1h),
                      WeatherList1d(weatherList: weather1d),
                    ],
                  ),
                )
          : const LoadingWidget(),
    );
  }
}
