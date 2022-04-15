import 'package:flutter/material.dart';
import 'package:weather/data/models/weather_list_model/weather_list_model.dart';
import 'package:weather/generated/l10n.dart';
import 'package:weather/utilities/constants.dart';

class WeatherItemScreen extends StatelessWidget {
  const WeatherItemScreen({required this.weather, Key? key}) : super(key: key);

  final WeatherListModel weather;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            weather.name ?? '',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: textBlack),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WeatherListElement(
                data: weather.main?.temp?.toInt().toString() ?? '',
                title: S.of(context).temperature,
                endIcon: S.of(context).cels,
              ),
              WeatherListElement(
                data: weather.main?.feelsLike?.toInt().toString() ?? '',
                title: S.of(context).feels_like,
                endIcon: S.of(context).cels,
              ),
              WeatherListElement(
                data: weather.main?.humidity?.toInt().toString() ?? '',
                title: S.of(context).humidity,
                endIcon: S.of(context).percent,
              ),
              WeatherListElement(
                data: weather.wind?.speed?.toInt().toString() ?? '',
                title: S.of(context).wind_speed,
                endIcon: S.of(context).meter_in_sec,
              ),
              Text(
                weather.weather?.first.description ?? '',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: textBlack),
              ),
            ],
          ),
        ));
  }
}

class WeatherListElement extends StatelessWidget {
  const WeatherListElement({
    Key? key,
    required this.data,
    required this.title,
    required this.endIcon,
  }) : super(key: key);

  final String title;
  final String data;
  final String endIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title),
        const SizedBox(width: 4),
        Text(data),
        const SizedBox(width: 4),
        Text(endIcon),
      ],
    );
  }
}
