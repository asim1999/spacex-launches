// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Launch _$LaunchFromJson(Map<String, dynamic> json) => Launch(
      siteId: json['launch_site']['site_id'] as String,
      missionName: json['mission_name'] as String,
      launchDate: Launch._fromJson(json['launch_date_unix'] as int),
      launchSuccess: json['launch_success'] as bool?,
      details: json['details'] as String?,
    );

Map<String, dynamic> _$LaunchToJson(Launch instance) => <String, dynamic>{
      'launch_site.site_id': instance.siteId,
      'mission_name': instance.missionName,
      'launch_date_unix': Launch._toJson(instance.launchDate),
      'launch_success': instance.launchSuccess,
      'details': instance.details,
    };
