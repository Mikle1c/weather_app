// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cities_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CitiesListModel _$CitiesListModelFromJson(Map<String, dynamic> json) =>
    CitiesListModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      coordinates: json['coordinates'] == null
          ? null
          : Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CitiesListModelToJson(CitiesListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'state': instance.state,
      'country': instance.country,
      'coordinates': instance.coordinates,
    };
