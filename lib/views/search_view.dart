import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';

import '../main.dart';

class searchView extends StatelessWidget {
  const searchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    backgroundColor: BlocProvider.of<GetWeatherCubit>(context).weatherModel != null
          ? getThemeColor(BlocProvider.of<GetWeatherCubit>(context).weatherModel?.weatherCondition)
          : Colors.blue,   title: Text(
          'Search a City',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
            child: TextField(
          onSubmitted: (value) async {
            var getWeatherCubit= BlocProvider.of<GetWeatherCubit>(context);
            getWeatherCubit.getWeather(cityName: value);
            Navigator.pop(context);

          },
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 30),
              labelText: 'Search',
              suffixIcon: Icon(Icons.search),
              hintText: 'Enter City Name',
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orangeAccent))),
        )),
      ),
    );
  }
}

