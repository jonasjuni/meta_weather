// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consolidated_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsolidatedWeather _$ConsolidatedWeatherFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ConsolidatedWeather',
      json,
      ($checkedConvert) {
        final val = ConsolidatedWeather(
          $checkedConvert('id', (v) => v as int),
          $checkedConvert('weather_state_name', (v) => v as String),
          $checkedConvert(
              'weather_state_abbr',
              (v) => _$enumDecode(_$WeatherStateEnumMap, v,
                  unknownValue: WeatherState.unknownEntry)),
          $checkedConvert('wind_direction_compass', (v) => v as String),
          $checkedConvert('created', (v) => DateTime.parse(v as String)),
          $checkedConvert(
              'applicable_date', (v) => DateTime.parse(v as String)),
          $checkedConvert('min_temp', (v) => (v as num).toDouble()),
          $checkedConvert('max_temp', (v) => (v as num).toDouble()),
          $checkedConvert('the_temp', (v) => (v as num).toDouble()),
          $checkedConvert('wind_speed', (v) => (v as num).toDouble()),
          $checkedConvert('air_pressure', (v) => (v as num).toDouble()),
          $checkedConvert('humidity', (v) => (v as num).toDouble()),
          $checkedConvert('visibility', (v) => (v as num).toDouble()),
          $checkedConvert('predictability', (v) => v as int),
        );
        return val;
      },
      fieldKeyMap: const {
        'weatherStateName': 'weather_state_name',
        'weatherState': 'weather_state_abbr',
        'windDirectionCompass': 'wind_direction_compass',
        'applicableDate': 'applicable_date',
        'minTemp': 'min_temp',
        'maxTemp': 'max_temp',
        'theTemp': 'the_temp',
        'windSpeed': 'wind_speed',
        'airPressure': 'air_pressure'
      },
    );

Map<String, dynamic> _$ConsolidatedWeatherToJson(
        ConsolidatedWeather instance) =>
    <String, dynamic>{
      'id': instance.id,
      'weather_state_name': instance.weatherStateName,
      'weather_state_abbr': _$WeatherStateEnumMap[instance.weatherState],
      'wind_direction_compass': instance.windDirectionCompass,
      'created': instance.created.toIso8601String(),
      'applicable_date': instance.applicableDate.toIso8601String(),
      'min_temp': instance.minTemp,
      'max_temp': instance.maxTemp,
      'the_temp': instance.theTemp,
      'wind_speed': instance.windSpeed,
      'air_pressure': instance.airPressure,
      'humidity': instance.humidity,
      'visibility': instance.visibility,
      'predictability': instance.predictability,
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

const _$WeatherStateEnumMap = {
  WeatherState.snow: 'sn',
  WeatherState.sleet: 'sl',
  WeatherState.hail: 'h',
  WeatherState.thunderstorm: 't',
  WeatherState.heavyRain: 'hr',
  WeatherState.lightRain: 'lr',
  WeatherState.showers: 's',
  WeatherState.heavyCloud: 'hc',
  WeatherState.lightCloud: 'lc',
  WeatherState.clear: 'c',
  WeatherState.unknownEntry: 'unknownEntry',
};
