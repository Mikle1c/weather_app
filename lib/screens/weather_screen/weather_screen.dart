import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather/bloc/weather_list_item_bloc/weather_list_item_bloc.dart';
import 'package:weather/data/models/cities_list_model/cities_list_model.dart';
import 'package:weather/data/models/weather_list_model/weather_list_model.dart';
import 'package:weather/generated/l10n.dart';
import 'package:weather/screens/weather_item_screen/weather_item_screen.dart';
import 'package:weather/utilities/constants.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  List<CitiesListModel> cities = [];

  void _fetchRegionWeather(int cityId) {
    BlocProvider.of<WeatherListItemBloc>(context)
        .add(FetchWeatherDataEvent(cityId: cityId));
  }

  void _fetchCitiesList() {
    BlocProvider.of<WeatherBloc>(context).add(FetchCitiesList());
  }

  void _pushDetilWeather(WeatherListModel weather) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => WeatherItemScreen(weather: weather)));
  }

  @override
  void initState() {
    _fetchCitiesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).weather,
          style:
              Theme.of(context).textTheme.bodyText1?.copyWith(color: textBlack),
        ),
      ),
      body: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {
          if (state is CitiesReceiveState) {
            cities = state.cities;
          }
        },
        builder: (context, state) {
          return ListView.builder(
              itemCount: cities.length,
              itemBuilder: (context, index) => WeatherListItemWidget(
                    city: cities[index],
                    pushAction: (weather) => _pushDetilWeather(weather),
                    selecAction: () =>
                        _fetchRegionWeather(cities[index].id ?? 0),
                  ));
        },
      ),
    );
  }
}

class WeatherListItemWidget extends StatelessWidget {
  const WeatherListItemWidget({
    Key? key,
    required this.city,
    required this.selecAction,
    required this.pushAction,
  }) : super(key: key);

  final CitiesListModel city;
  final Function selecAction;
  final Function(WeatherListModel) pushAction;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherListItemBloc, WeatherListItemState>(
      buildWhen: (context, state) {
        if (state is WeatherReceiveState && state.weatherModel.id != city.id ||
            state is WeatherItemLoadingData && state.id != city.id) {
          return false;
        }
        return true;
      },
      listener: (context, state) {
        if (state is WeatherReceiveState) {
          if (state.weatherModel.id == city.id) {
            pushAction(state.weatherModel);
          }
        }
      },
      builder: (context, state) {
        return ListTile(
          onTap: () => selecAction(),
          title: Text(city.name ?? ''),
          trailing: (state is WeatherItemLoadingData && state.id == city.id)
              ? const CircularProgressIndicator(
                  color: primary,
                )
              : Text(city.country ?? ''),
        );
      },
    );
  }
}
