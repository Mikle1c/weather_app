import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_router_event.dart';
part 'app_router_state.dart';

class AppRouterBloc extends Bloc<AppRouterEvent, AppRouterState> {
  AppRouterBloc() : super(SplashScreenShowState()) {
    on<AppRouterEvent>((event, emit) async {
      if (event is ShowSplashSceen) {
        emit(SplashScreenShowState());
      } else if (event is ShowMainSceen) {
        emit(MainScreenShowState());
      }
    });
  }
}
