part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherLoadingData extends WeatherState {}

class WeatherItemInitial extends WeatherState {}

class CitiesReceiveState extends WeatherState {
  final List<CitiesListModel> cities;

  CitiesReceiveState({
    required this.cities,
  });
}
