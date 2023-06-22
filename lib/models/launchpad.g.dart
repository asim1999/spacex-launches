// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launchpad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Launchpad _$LaunchpadFromJson(Map<String, dynamic> json) => Launchpad(
      siteId: json['site_id'] as String,
      long: (json['location']['longitude'] as num).toDouble(),
      lat: (json['location']['latitude'] as num).toDouble(),
      name: json['location']['name'] as String,
      region: json['location']['region'] as String,
      details: json['details'] as String?,
    );

Map<String, dynamic> _$LaunchpadToJson(Launchpad instance) => <String, dynamic>{
      'site_id': instance.siteId,
      'location.longitude': instance.long,
      'location.latitude': instance.lat,
      'location.name': instance.name,
      'location.region': instance.region,
      'details': instance.details,
    };
