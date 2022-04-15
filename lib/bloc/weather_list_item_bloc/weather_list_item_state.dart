part of 'weather_list_item_bloc.dart';

@immutable
abstract class WeatherListItemState {}

class WeatherItemLoadingData extends WeatherListItemState {
  final int id;
  WeatherItemLoadingData({
    required this.id,
  });
}

class WeatherItemInitial extends WeatherListItemState {}

class WeatherReceiveState extends WeatherListItemState {
  final WeatherListModel weatherModel;

  WeatherReceiveState({
    required this.weatherModel,
  });
}
