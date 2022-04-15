import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather/bloc/message_handling_bloc.dart';
import 'package:weather/data/models/weather_list_model/weather_list_model.dart';
import 'package:weather/data/repositories/weather_repository.dart';

part 'weather_list_item_event.dart';
part 'weather_list_item_state.dart';

class WeatherListItemBloc
    extends Bloc<WeatherListItemEvent, WeatherListItemState> {
  final WeatherRepository weatherRepository;
  final MessageHandlingBloc messageHandlingBloc;
  WeatherListItemBloc({
    required this.weatherRepository,
    required this.messageHandlingBloc,
  }) : super(WeatherItemInitial()) {
    on<WeatherListItemEvent>((event, emit) async {
      if (event is FetchWeatherDataEvent) {
        emit.call(WeatherItemLoadingData(id: event.cityId));
        try {
          final Map<String, dynamic> parameters = {
            'id': event.cityId,
          };
          final response = await weatherRepository.fetchWeatherList(parameters);
          emit.call(WeatherReceiveState(weatherModel: response));
        } on Exception catch (error) {
          messageHandlingBloc.add(MessageHandlingBlocShowError(error: error));
          emit.call(WeatherItemInitial());
        }
      }
    });
  }
}
