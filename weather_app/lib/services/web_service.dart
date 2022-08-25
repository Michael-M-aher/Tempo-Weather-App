import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import '../config/api_keys.dart';
import '../config/strings.dart';
import 'shared_prefs.dart';

class WeatherWebService {
  late Dio dio;
  WeatherWebService() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getWeather() async {
    try {
      double lat = sharedPrefs.location.latitude;
      double lon = sharedPrefs.location.longitude;
      Response response = await dio.get('timelines', queryParameters: {
        'apikey': (apiKey..shuffle()).first,
        'units': 'metric',
        'timesteps': 'current',
        'fields':
            'temperature,humidity,windSpeed,precipitationProbability,weatherCode',
        'location': '$lat,$lon'
      });
      // Response response = await dio.get('b95b8a23-63ea-436d-b0fe-950ac9263acd');
      return response.data["data"]["timelines"][0]["intervals"];
    } catch (e) {
      debugPrint(e.toString());
      final String response = sharedPrefs.weather1h;
      if (response != '') {
        return json
            .decode(response)["data"]["timelines"][0]["intervals"]
            .where((element) =>
                DateTime.parse(element["startTime"])
                        .difference(DateTime.now())
                        .inDays ==
                    0 &&
                DateTime.parse(element["startTime"])
                        .difference(DateTime.now())
                        .inHours ==
                    0)
            .toList();
      } else {
        return [];
      }
    }
  }

  Future<List<dynamic>> getWeather1h() async {
    try {
      double lat = sharedPrefs.location.latitude;
      double lon = sharedPrefs.location.longitude;
      Response response = await dio.get('timelines', queryParameters: {
        'apikey': (apiKey..shuffle()).first,
        'units': 'metric',
        'timesteps': '1h',
        'fields':
            'temperature,humidity,windSpeed,precipitationProbability,sunriseTime,sunsetTime,weatherCode',
        'location': '$lat,$lon'
      });
      // Response response1 =
      // await dio.get('1ddfeef4-4546-468b-8999-c40d1bffa6d2');
      sharedPrefs.weather1h = json.encode(response.data);
      return response.data["data"]["timelines"][0]["intervals"];
    } catch (e) {
      // ignore: avoid_print
      final String response = sharedPrefs.weather1h;
      if (response != '') {
        return json.decode(response)["data"]["timelines"][0]["intervals"];
      } else {
        return [];
      }
    }
  }

  Future<List<dynamic>> getWeather1d() async {
    try {
      double lat = sharedPrefs.location.latitude;
      double lon = sharedPrefs.location.longitude;
      Response response = await dio.get('timelines', queryParameters: {
        'apikey': (apiKey..shuffle()).first,
        'units': 'metric',
        'timesteps': '1d',
        'fields':
            'temperature,humidity,windSpeed,precipitationProbability,sunriseTime,sunsetTime,weatherCode',
        'location': '$lat,$lon'
      });
      // Response response1 =
      //     await dio.get('21ff9dd5-d554-490a-9b0a-ce486558769d');
      sharedPrefs.weather1d = json.encode(response.data);
      return response.data["data"]["timelines"][0]["intervals"];
    } catch (e) {
      // ignore: avoid_print
      final String response = sharedPrefs.weather1d;
      if (response != '') {
        return json.decode(response)["data"]["timelines"][0]["intervals"];
      } else {
        return [];
      }
    }
  }
}
