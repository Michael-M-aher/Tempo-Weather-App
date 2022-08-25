import '../models/weather.dart';
import '../services/web_service.dart';

class WeatherRepository {
  final WeatherWebService weatherWebService;
  WeatherRepository(this.weatherWebService);

  Future<Weather> getWeather() async {
    final weather = await weatherWebService.getWeather();
    return weather.map((weather) => Weather.fromJson(weather)).first;
  }

  Future<List<Weather>> getWeather1h() async {
    final weather = await weatherWebService.getWeather1h();
    List<Weather> weatherList =
        weather.map((weather) => Weather.fromJson(weather)).toList();
    weatherList.removeWhere((weather) =>
        (weather.startTime!.year < DateTime.now().year ||
            weather.startTime!.month < DateTime.now().month ||
            weather.startTime!.day < DateTime.now().day) ||
        (weather.startTime!.day == DateTime.now().day &&
            weather.startTime!.hour <= DateTime.now().hour));
    return weatherList;
  }

  Future<List<Weather>> getWeather1d() async {
    final weather = await weatherWebService.getWeather1d();
    List<Weather> weatherList =
        weather.map((weather) => Weather.fromJson(weather)).toList();
    weatherList.removeWhere((weather) =>
        (weather.startTime!.year < DateTime.now().year ||
            (weather.startTime!.year == DateTime.now().year &&
                weather.startTime!.month < DateTime.now().month) ||
            (weather.startTime!.month == DateTime.now().month &&
                weather.startTime!.day <= DateTime.now().day)));
    return weatherList;
  }
}
