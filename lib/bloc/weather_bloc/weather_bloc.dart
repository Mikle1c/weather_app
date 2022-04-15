import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather/bloc/message_handling_bloc.dart';
import 'package:weather/data/models/cities_list_model/cities_list_model.dart';
import 'package:weather/data/repositories/weather_repository.dart';
import 'package:weather/utilities/constants.dart';
import 'package:weather/helpers.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  final MessageHandlingBloc messageHandlingBloc;
  WeatherBloc({
    required this.weatherRepository,
    required this.messageHandlingBloc,
  }) : super(WeatherItemInitial()) {
    on<WeatherEvent>((event, emit) async {
      if (event is FetchCitiesList) {
        final citiesListMode =
            await SecretLoader(secretPath: citiesPath).loadCities();
        emit.call(CitiesReceiveState(cities: citiesListMode));
      }
    });
  }
}
