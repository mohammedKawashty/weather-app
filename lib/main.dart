import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weatherapp/views/homeview.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: BlocBuilder<GetWeatherCubit, WeatherStates>(
        builder: (context, state) {
          String? weatherCondition = BlocProvider.of<GetWeatherCubit>(context)
              .weatherModel
              ?.weatherCondition;
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: getThemeColor(weatherCondition),
            ),
            home: HomeView(),
          );
        },
      ),
    );
  }
}
MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }

  // Normalize condition by making it lowercase and trimming whitespaces
  condition = condition.toLowerCase().trim();

  switch (condition) {
    case 'sunny':
      return Colors.orange;
    case 'partly cloudy':
      return Colors.blue;
    case 'cloudy':
    case 'blizzard':
      return Colors.grey;
    case 'overcast':
      return Colors.blueGrey;
    case 'mist':
      return Colors.indigo;
    case 'patchy rain possible':
      return Colors.lightBlue;
    case 'patchy snow possible':
      return Colors.lightBlue;
    case 'patchy sleet possible':
      return Colors.cyan;
    case 'thundery outbreaks possible':
      return Colors.deepPurple;

    default:
      return Colors.blue; // Default color if condition is unknown
  }
}