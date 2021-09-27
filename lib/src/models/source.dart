import 'package:json_annotation/json_annotation.dart';

part 'source.g.dart';

@JsonSerializable()
class Source {
  /// Name of the source
  final String title;

  /// Slang name
  final String slug;

  /// URL of the source
  final String url;
  final int crawlRate;

  const Source(this.title, this.slug, this.url, this.crawlRate);

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
  Map<String, dynamic> toJson() => _$SourceToJson(this);
}
