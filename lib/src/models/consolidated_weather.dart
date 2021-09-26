import 'package:json_annotation/json_annotation.dart';

part 'consolidated_weather.g.dart';

/// Weather state enum
enum WeatherState {
  @JsonValue('sn')
  snow,
  @JsonValue('sl')
  sleet,
  @JsonValue('h')
  hail,
  @JsonValue('t')
  thunderstorm,
  @JsonValue('hr')
  heavyRain,
  @JsonValue('lr')
  lightRain,
  @JsonValue('s')
  showers,
  @JsonValue('hc')
  heavyCloud,
  @JsonValue('lc')
  lightCloud,
  @JsonValue('c')
  clear,
  unknownEntry,
}

extension WeatherStateX on WeatherState {
  String? get abbr => _$WeatherStateEnumMap[this];
}

@JsonSerializable()
class ConsolidatedWeather {
  /// Internal identifier for the forecast
  final int id;

  /// Text description of the weather state
  final String weatherStateName;

  /// Weather state enum, one or two letter abbreviation of the weather state
  @JsonKey(
      name: 'weather_state_abbr', unknownEnumValue: WeatherState.unknownEntry)
  final WeatherState weatherState;

  /// Compass point of the wind direction
  final String windDirectionCompass;

  /// Date of entry creation
  final DateTime created;

  /// Date that the forecast or observation pertains to
  final DateTime applicableDate;

  /// Min temperature in `centigrade`
  final double minTemp;

  /// Max temperature in `centigrade`
  final double maxTemp;

  /// Current temperature in `centigrade`
  @JsonKey(name: 'the_temp')
  final double temp;

  /// Wind speed in `mph`
  final double windSpeed;

  /// airPressue in `mbar`
  final double airPressure;

  /// percentage of water vapor in the air
  final double humidity;

  /// Visibility in `miles`
  final double visibility;

  /// Percentage of our interpretation of the level to which the forecasters agree with each other - 100% being a complete consensus.
  final int predictability;

  ConsolidatedWeather(
      this.id,
      this.weatherStateName,
      this.weatherState,
      this.windDirectionCompass,
      this.created,
      this.applicableDate,
      this.minTemp,
      this.maxTemp,
      this.temp,
      this.windSpeed,
      this.airPressure,
      this.humidity,
      this.visibility,
      this.predictability);

  factory ConsolidatedWeather.fromJson(Map<String, dynamic> json) =>
      _$ConsolidatedWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$ConsolidatedWeatherToJson(this);
}
