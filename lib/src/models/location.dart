import 'package:json_annotation/json_annotation.dart';
import 'models.dart';

part 'location.g.dart';

enum LocationType {
  @JsonValue('City')
  city,
  @JsonValue('Region / State / Province')
  regionStateProvince,
  @JsonValue('Country')
  country,
  @JsonValue('Continent')
  continent
}

@JsonSerializable()
class Location {
  /// distance in `Meters` - Only returned on a lattlong search
  final int? distance;

  /// Name of the location
  final String title;
  final LocationType locationType;

  /// Where On Earth ID
  final int woeid;

  @JsonKey(name: 'latt_long')
  final Coordinates lattLong;

  const Location(
    this.distance,
    this.title,
    this.locationType,
    this.woeid,
    this.lattLong,
  );

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
