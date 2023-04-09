import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/domain/entities/weather.dart';

class WeatherInfoCard extends StatelessWidget {
  final Weather weather;
  const WeatherInfoCard({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        gradient: LinearGradient(
          colors: [
            Colors.grey.shade300,
            Colors.grey.shade100,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade700,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          Text(
            'City -> ${weather.cityName}',
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            'Country -> ${weather.country}',
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            'Temp C -> ${weather.tempC} C',
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            'Temp F -> ${weather.tempF} F',
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            'Condition -> ${weather.condition}',
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            'Feels like C-> ${weather.feelsLikeC} C',
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            'Feels like F-> ${weather.feelsLikeF} F',
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
