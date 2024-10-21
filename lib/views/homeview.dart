import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weatherapp/views/search_view.dart';
import 'package:weatherapp/widgets/no_weather.dart';
import 'package:weatherapp/widgets/weather_info.dart';

import '../main.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BlocProvider.of<GetWeatherCubit>(context).weatherModel != null
            ? getThemeColor(BlocProvider.of<GetWeatherCubit>(context).weatherModel?.weatherCondition)
            : Colors.blue, // Default color if no weather data
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return searchView();
                  }),
                );
              },
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
        title: Text(
          'Weather App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body:BlocBuilder<GetWeatherCubit, WeatherStates>(
        builder: (context, state) {
          if(state is NoWeatherState){
            return noWeather();
          }else if(state is WeatherLoadedState){
            return weatherInfoViweo();
          }else{
            return Text('oops there was an error');
          }
        },
      ),
    );
  }
}
