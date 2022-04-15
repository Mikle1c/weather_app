import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:weather/data/models/cities_list_model/cities_list_model.dart';

class Secret {
  final String apikey;

  Secret({this.apikey = ''});

  factory Secret.fromJson(Map<String, dynamic> jsonMap) {
    return Secret(apikey: jsonMap['api_key']);
  }
}

class SecretLoader {
  final String secretPath;

  SecretLoader({required this.secretPath});
  Future<Secret> load() {
    return rootBundle.loadStructuredData<Secret>(secretPath, (jsonStr) async {
      final secret = Secret.fromJson(jsonDecode(jsonStr));
      return secret;
    });
  }

  Future<List<CitiesListModel>> loadCities() {
    return rootBundle.loadStructuredData<List<CitiesListModel>>(secretPath,
        (jsonStr) async {
      final decodeList = jsonDecode(jsonStr) as List;
      final citiesList =
          decodeList.map((item) => CitiesListModel.fromJson(item)).toList();
      // final citiesModel = CitiesListModel.fromJson(decodeString);
      return citiesList;
    });
  }
}
