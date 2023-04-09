import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/example/presentation/widgets/weather_info_card.dart';
import 'package:weather_app/features/weather/domain/providers/weather_info_notifier.dart';

class WeatherPage extends ConsumerWidget {
  static const routeName = '/weather';
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = TextEditingController();
    final state = ref.watch(weatherInfoNotifierProvider);
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
                        ref
                            .read(weatherInfoNotifierProvider.notifier)
                            .getWeatherInfo(searchController.text);
                        searchController.text = '';
                      },
                      child: const Text('Search'),
                    ),
                  ],
                ),
                //const Text('ode nesto'),
                const SizedBox(height: 30),

                state.when(
                  initial: () => const SizedBox(),
                  loading: () => const CircularProgressIndicator(),
                  data: (weather) => WeatherInfoCard(weather: weather),
                  error: (failure) => Text(failure.title),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
