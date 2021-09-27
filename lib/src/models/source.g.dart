// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Source _$SourceFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Source',
      json,
      ($checkedConvert) {
        final val = Source(
          $checkedConvert('title', (v) => v as String),
          $checkedConvert('slug', (v) => v as String),
          $checkedConvert('url', (v) => v as String),
          $checkedConvert('crawl_rate', (v) => v as int),
        );
        return val;
      },
      fieldKeyMap: const {'crawlRate': 'crawl_rate'},
    );

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
      'title': instance.title,
      'slug': instance.slug,
      'url': instance.url,
      'crawl_rate': instance.crawlRate,
    };
