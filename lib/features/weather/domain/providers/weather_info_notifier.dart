import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:q_architecture/q_architecture.dart';
import 'package:weather_app/features/weather/data/repositories/weather_repository.dart';
import 'package:weather_app/features/weather/domain/entities/weather.dart';

final weatherInfoNotifierProvider = StateNotifierProvider.family<
    WeatherInfoNotifier, BaseState<Weather>, String>(
  (ref, city) => WeatherInfoNotifier(
    ref,
    ref.watch(weatherRepositoryProvider),
    city,
  )..getWeatherInfo(),
);

class WeatherInfoNotifier extends BaseStateNotifier<Weather> {
  final WeatherRepository _weatherRepository;
  final String _city;
  WeatherInfoNotifier(super.ref, this._weatherRepository, this._city);

  void getWeatherInfo() => execute(
        _weatherRepository.getWeatherInfo(_city),
        withLoadingState: true,
        globalLoading: true,
      );
}
