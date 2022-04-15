part of 'main_bloc.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class WeatherTabState extends MainState {}

class InformationTabState extends MainState {}
