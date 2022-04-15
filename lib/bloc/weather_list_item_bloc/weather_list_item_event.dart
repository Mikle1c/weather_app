part of 'weather_list_item_bloc.dart';

@immutable
abstract class WeatherListItemEvent {}

class FetchWeatherDataEvent extends WeatherListItemEvent {
  final int cityId;

  FetchWeatherDataEvent({
    required this.cityId,
  });
}
