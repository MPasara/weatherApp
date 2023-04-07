// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:q_architecture/q_architecture.dart';
import 'package:weather_app/common/data/api_client.dart';
import 'package:weather_app/common/data/providers.dart';
import 'package:weather_app/features/weather/data/models/weather_response.dart';
import 'package:weather_app/features/weather/domain/entities/weather.dart';

final weatherRepositoryProvider = Provider<WeatherRepository>(
  (ref) => WeatherRepositoryImpl(
    ref.watch(apiClientProvider),
  ),
);

abstract class WeatherRepository {
  EitherFailureOr<Weather> getWeatherInfo(String city);
}

class WeatherRepositoryImpl implements WeatherRepository {
  final ApiClient _apiClient;
  WeatherRepositoryImpl(
    this._apiClient,
  );

  Weather mapWeatherResponseToEntity(WeatherResponse response) {
    return Weather(
      cityName: response.location.name,
      country: response.location.country,
      tempC: response.current.tempC.toString(),
      tempF: response.current.tempF.toString(),
      feelsLikeC: response.current.feelslikeC.toString(),
      feelsLikeF: response.current.feelslikeF.toString(),
      condition: response.current.condition.text,
    );
  }

  @override
  EitherFailureOr<Weather> getWeatherInfo(String city) async {
    try {
      final response = await _apiClient.getWeatherInfo(city: city);
      final weather = mapWeatherResponseToEntity(response);
      return Right(weather);
    } catch (e) {
      log('oopsie poopsie');
      log(e.toString());
      return Left(Failure.generic(
        error: e.toString(),
      ));
    }
  }
}
