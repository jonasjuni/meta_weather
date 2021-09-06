class Coordinates {
  final double? latitude;
  final double? longitude;

  const Coordinates({this.latitude, this.longitude});

  factory Coordinates.fromJson(String? json) {
    if (json != null) {
      final part = json.split(',');
      if (part.length == 2) {
        return Coordinates(
            latitude: double.tryParse(part[0]),
            longitude: double.tryParse(part[1]));
      }
    }
    return const Coordinates();
  }

  String? toJson() => '${latitude ?? ''},${longitude ?? ''}';
}
