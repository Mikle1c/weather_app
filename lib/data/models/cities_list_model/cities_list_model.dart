import 'package:json_annotation/json_annotation.dart';

import 'coordinates.dart';

part 'cities_list_model.g.dart';

@JsonSerializable()
class CitiesListModel {
  int? id;
  String? name;
  String? state;
  String? country;
  Coordinates? coordinates;

  CitiesListModel({
    this.id,
    this.name,
    this.state,
    this.country,
    this.coordinates,
  });

  factory CitiesListModel.fromJson(Map<String, dynamic> json) {
    return _$CitiesListModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CitiesListModelToJson(this);
}
