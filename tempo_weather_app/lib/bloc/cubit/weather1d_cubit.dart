import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/weather.dart';
import '../../repository/weather_repository.dart';

part 'weather1d_state.dart';

class Weather1dCubit extends Cubit<Weather1dState> {
  final WeatherRepository weatherRepository;
  Weather1dCubit(this.weatherRepository) : super(Weather1dInitial());

  void getWeather1d() {
    weatherRepository.getWeather1d().then((weather1d) {
      emit(Weather1dLoaded(weather1d));
    });
  }
}
