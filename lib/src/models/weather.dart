import 'package:json_annotation/json_annotation.dart';
import 'models.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  final List<ConsolidatedWeather> consolidatedWeather;
  final DateTime time;
  final DateTime sunRise;
  final DateTime sunSet;
  final String timezoneName;
  final Location parent;
  final String title;
  final LocationType locationType;
  final int woeid;
  final Coordinates lattLong;
  final String timezone;

  Weather(
      this.consolidatedWeather,
      this.time,
      this.sunRise,
      this.sunSet,
      this.timezoneName,
      this.parent,
      this.title,
      this.locationType,
      this.woeid,
      this.lattLong,
      this.timezone);

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
