import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/features/weather/domain/providers/weather_info_notifier.dart';

class WeatherPage extends ConsumerWidget {
  static const routeName = '/weather';
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = TextEditingController();
    final state = ref.watch(weatherInfoNotifierProvider(searchController.text));
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 200,
                      child: TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'City',
                        ),
                        controller: searchController,
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        searchController.text = 'boston';
                        ref
                            .read(weatherInfoNotifierProvider(
                              searchController.text,
                            ).notifier)
                            .getWeatherInfo();
                        searchController.text = '';
                      },
                      child: const Text('Search'),
                    ),
                  ],
                ),
                //const Text('ode nesto'),
                const SizedBox(height: 30),
                state.map(
                  initial: (_) => Container(),
                  loading: (_) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  data: (weatherData) => Container(
                    color: Colors.amber,
                    width: 200,
                    height: 200,
                    child: Text(
                      weatherData.data.cityName,
                    ),
                  ),
                  error: (c) => Container(),
                ),

                /* state.when(
                  initial: () => const SizedBox(),
                  loading: () => const CircularProgressIndicator(),
                  data: (weather) => Text(
                    weather.cityName,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  error: (e) => Center(
                    child: Text(
                      e.title,
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ), */
              ],
            ),
          ),
        ),
      ),
    );
  }
}
