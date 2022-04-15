import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather/data/repositories/weather_repository.dart';
import 'package:weather/utilities/constants.dart';
import 'package:weather/helpers.dart';
import 'package:weather/weather.dart';

void main() {
  final dio = Dio(
    BaseOptions(
      baseUrl: apiHost,
      headers: {"appid": "{API key}"},
    ),
  );

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) async {
      final secret = await SecretLoader(secretPath: secretPath).load();
      options.queryParameters['appid'] = secret.apikey;
      options.queryParameters['lang'] = 'ru';
      options.queryParameters['units'] = 'metric';
      handler.next(options);
    },
  ));

  dio.interceptors.add(LogInterceptor(request: true, requestBody: true));

  final weatherRepository = WeatherRepository(dio: dio);

  runApp(WeatherApp(
    weatherRepository: weatherRepository,
  ));
}
