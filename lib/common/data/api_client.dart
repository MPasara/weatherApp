// ignore_for_file: always_use_package_imports

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_app/features/weather/data/models/weather_response.dart';

import '../../example/data/models/example_user_response.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;

  @GET('')
  Future<WeatherResponse> getWeatherInfo(@Query('q') String city);
}
