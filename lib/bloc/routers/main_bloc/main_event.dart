part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}

class ShowWeatherEvent extends MainEvent {}

class ShowInformationEvent extends MainEvent {}
