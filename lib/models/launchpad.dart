import 'package:json_annotation/json_annotation.dart';

part 'launchpad.g.dart';

@JsonSerializable()
class Launchpad {

  @JsonKey(name: 'site_id')
  final String siteId;

  @JsonKey(name: 'location.longitude')
  final double long;

  @JsonKey(name: 'location.latitude')
  final double lat;

  @JsonKey(name: 'location.name')
  String name;

  @JsonKey(name: 'location.region')
  String region;

  @JsonKey(name: 'details')
  String details;


  Launchpad(
      {required this.siteId, required this.long, required this.lat, required this.name, required this.region,
        required this.details,});

  /// Connect the generated [_$LaunchFromJson] function to the `fromJson`
  /// factory.
  factory Launchpad.fromJson(Map<String, dynamic> json) =>
      _$LaunchpadFromJson(json);

  /// Connect the generated [__$LaunchpadToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$LaunchpadToJson(this);
}