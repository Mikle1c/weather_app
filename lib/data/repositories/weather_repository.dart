import 'package:dio/dio.dart';
import 'package:weather/data/models/weather_list_model/weather_list_model.dart';

class WeatherRepository {
  final Dio dio;

  WeatherRepository({required this.dio});

  Future<WeatherListModel> fetchWeatherList(
      Map<String, dynamic> parameters) async {
    final response = await dio.get('/weather', queryParameters: parameters);
    final result = WeatherListModel.fromJson(response.data);
    return result;
  }
}
