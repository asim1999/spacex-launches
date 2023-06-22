// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launchpad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LaunchPad _$LaunchPadFromJson(Map<String, dynamic> json) => LaunchPad(
      siteId: json['site_id'] as String,
      long: (json['location.longitude'] as num).toDouble(),
      lat: (json['location.latitude'] as num).toDouble(),
      name: json['location.name'] as String,
      region: json['location.region'] as String,
      details: json['details'] as String,
    );

Map<String, dynamic> _$LaunchPadToJson(LaunchPad instance) => <String, dynamic>{
      'site_id': instance.siteId,
      'location.longitude': instance.long,
      'location.latitude': instance.lat,
      'location.name': instance.name,
      'location.region': instance.region,
      'details': instance.details,
    };
