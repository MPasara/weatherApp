import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/features/weather/data/models/current.dart';
import 'package:weather_app/features/weather/data/models/location.dart';

part 'weather_response.g.dart';

@JsonSerializable()
class WeatherResponse {
  Location location;
  Current current;

  WeatherResponse({
    required this.location,
    required this.current,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);
}
