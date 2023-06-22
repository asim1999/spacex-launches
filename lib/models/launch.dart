import 'package:json_annotation/json_annotation.dart';

part 'launch.g.dart';

@JsonSerializable()
class Launch {
  @JsonKey(name: 'launch_site.site_id')
  final String siteId;

  @JsonKey(name: 'mission_name')
  final String missionName;

  @JsonKey(
    name: 'launch_date_unix',
    toJson: _toJson,
    fromJson: _fromJson,
  )
  final DateTime launchDate;

  @JsonKey(name: 'launch_success')
  final bool? launchSuccess;

  @JsonKey(name: 'details')
  final String? details;

  Launch({
    required this.siteId,
    required this.missionName,
    required this.launchDate,
    required this.launchSuccess,
    required this.details,
  });

  /// Connect the generated [_$LaunchFromJson] function to the `fromJson`
  /// factory.
  factory Launch.fromJson(Map<String, dynamic> json) => _$LaunchFromJson(json);

  /// Connect the generated [__$LaunchToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$LaunchToJson(this);

  //From and toJson date methods
  static int _toJson(DateTime value) => value.millisecondsSinceEpoch;

  static DateTime _fromJson(int value) =>
      DateTime.fromMillisecondsSinceEpoch(value);
}
