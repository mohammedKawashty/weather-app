
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weatherapp/models/weather_model.dart';

class weatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey='c5e6038f96b949e7924172355241809';

  weatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String city}) async {
    try {
      Response response = await dio.get(
          '$baseUrl/forecast.json?key=$apiKey&q=$city&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMessage=e.response?.data['error']['message']??'oops try later';
      throw Exception(errMessage);

    }catch(e){
      log(e.toString());
      throw Exception('oops there was an error try later');
    }
  }
}
