import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/main.dart';
import 'package:weatherapp/models/weather_model.dart';

class weatherInfoViweo extends StatelessWidget {
  const weatherInfoViweo({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              getThemeColor(weatherModel.weatherCondition),
              getThemeColor(weatherModel.weatherCondition)[300]!,
              getThemeColor(weatherModel.weatherCondition)[50]!
      ],
              begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                weatherModel.cityName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
              Text(
                'apdate at ${weatherModel.date.hour}:${weatherModel.date.minute}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                    image: NetworkImage('https:${weatherModel.image}'),
                  ),
                  Text(
                    weatherModel.temp.toString(),
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Maxtemp: ${weatherModel.maxTemp.round()}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Mintemp: ${weatherModel.minTemp.round()}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                weatherModel.weatherCondition,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}


