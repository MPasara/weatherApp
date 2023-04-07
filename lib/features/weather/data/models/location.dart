import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  String name;
  String region;
  String country;
  double lat;
  double lon;
  @JsonKey(name: 'tz_id')
  String tzId;
  @JsonKey(name: 'localtime_epoch')
  int? localtimeEpoch;
  String localtime;

  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
