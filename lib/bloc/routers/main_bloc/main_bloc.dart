import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(WeatherTabState()) {
    on<MainEvent>((event, emit) {
      if (event is ShowWeatherEvent) {
        emit.call(WeatherTabState());
      } else if (event is ShowInformationEvent) {
        emit.call(InformationTabState());
      }
    });
  }
}
