import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weatherapp/models/weather_model.dart';
import '../../services/weather service.dart';


class GetWeatherCubit extends Cubit<WeatherStates>{
  GetWeatherCubit():super(NoWeatherState());
   WeatherModel? weatherModel;

  getWeather({required String cityName}) async { try {
    weatherModel =
    await weatherService(Dio()).
    getCurrentWeather(city: cityName);
   emit(WeatherLoadedState());
 } catch (e) {
    emit(WeatherFailureState());
 }

  }

}