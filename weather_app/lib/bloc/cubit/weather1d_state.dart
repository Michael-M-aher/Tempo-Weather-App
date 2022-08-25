part of 'weather1d_cubit.dart';

@immutable
abstract class Weather1dState {}

class Weather1dInitial extends Weather1dState {}

class Weather1dLoaded extends Weather1dState {
  final List<Weather> weather1d;
  Weather1dLoaded(this.weather1d);
}
