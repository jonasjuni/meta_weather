// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return $checkedNew('Weather', json, () {
    final val = Weather(
      $checkedConvert(
          json,
          'consolidated_weather',
          (v) => (v as List<dynamic>)
              .map((e) =>
                  ConsolidatedWeather.fromJson(e as Map<String, dynamic>))
              .toList()),
      $checkedConvert(json, 'time', (v) => DateTime.parse(v as String)),
      $checkedConvert(json, 'sun_rise', (v) => DateTime.parse(v as String)),
      $checkedConvert(json, 'sun_set', (v) => DateTime.parse(v as String)),
      $checkedConvert(json, 'timezone_name', (v) => v as String),
      $checkedConvert(
          json, 'parent', (v) => Location.fromJson(v as Map<String, dynamic>)),
      $checkedConvert(json, 'title', (v) => v as String),
      $checkedConvert(
          json, 'location_type', (v) => _$enumDecode(_$LocationTypeEnumMap, v)),
      $checkedConvert(json, 'woeid', (v) => v as int),
      $checkedConvert(
          json, 'latt_long', (v) => Coordinates.fromJson(v as String)),
      $checkedConvert(json, 'timezone', (v) => v as String),
    );
    return val;
  }, fieldKeyMap: const {
    'consolidatedWeather': 'consolidated_weather',
    'sunRise': 'sun_rise',
    'sunSet': 'sun_set',
    'timezoneName': 'timezone_name',
    'locationType': 'location_type',
    'lattLong': 'latt_long'
  });
}

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'consolidated_weather':
          instance.consolidatedWeather.map((e) => e.toJson()).toList(),
      'time': instance.time.toIso8601String(),
      'sun_rise': instance.sunRise.toIso8601String(),
      'sun_set': instance.sunSet.toIso8601String(),
      'timezone_name': instance.timezoneName,
      'parent': instance.parent.toJson(),
      'title': instance.title,
      'location_type': _$LocationTypeEnumMap[instance.locationType],
      'woeid': instance.woeid,
      'latt_long': instance.lattLong.toJson(),
      'timezone': instance.timezone,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$LocationTypeEnumMap = {
  LocationType.city: 'City',
  LocationType.regionStateProvince: 'Region / State / Province',
  LocationType.country: 'Country',
  LocationType.continent: 'Continent',
};
