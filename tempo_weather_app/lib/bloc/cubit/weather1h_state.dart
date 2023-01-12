part of 'weather1h_cubit.dart';

@immutable
abstract class Weather1hState {}

class Weather1hInitial extends Weather1hState {}

class Weather1hLoaded extends Weather1hState {
  final List<Weather> weather1h;
  Weather1hLoaded(this.weather1h);
}
