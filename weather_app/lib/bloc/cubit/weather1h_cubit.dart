import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/weather.dart';
import '../../repository/weather_repository.dart';

part 'weather1h_state.dart';

class Weather1hCubit extends Cubit<Weather1hState> {
  final WeatherRepository weatherRepository;
  Weather1hCubit(this.weatherRepository) : super(Weather1hInitial());

  void getWeather1h() {
    weatherRepository.getWeather1h().then((weather1h) {
      emit(Weather1hLoaded(weather1h));
    });
  }
}
