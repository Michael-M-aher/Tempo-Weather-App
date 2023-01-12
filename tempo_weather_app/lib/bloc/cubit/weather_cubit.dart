import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/weather.dart';
import '../../repository/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherCubit(this.weatherRepository) : super(WeatherInitial());

  void getWeather() {
    weatherRepository.getWeather().then((weather) {
      emit(WeatherLoaded(weather));
    });
  }
}
