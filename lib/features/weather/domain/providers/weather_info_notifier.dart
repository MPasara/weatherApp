import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:q_architecture/q_architecture.dart';
import 'package:weather_app/features/weather/data/repositories/weather_repository.dart';
import 'package:weather_app/features/weather/domain/entities/weather.dart';

final weatherInfoNotifierProvider =
    StateNotifierProvider<WeatherInfoNotifier, BaseState<Weather>>(
  (ref) => WeatherInfoNotifier(
    ref,
    ref.watch(weatherRepositoryProvider),
  ),
);

class WeatherInfoNotifier extends BaseStateNotifier<Weather> {
  final WeatherRepository _weatherRepository;

  WeatherInfoNotifier(super.ref, this._weatherRepository);

  void getWeatherInfo(String _city) => execute(
        _weatherRepository.getWeatherInfo(_city),
      );
}
