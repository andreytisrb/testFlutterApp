import 'dart:convert';

import 'package:clima/domain/entity.dart';
import 'package:clima/domain/weather_interactor.dart';
import 'package:http/http.dart' as http;

class WeatherNetwork extends WeatherInteractor{
  static const String url = "https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22";
  //"https://samples.openweathermap.org/data/2.5/weather";

  Future<WeatherInfo> getWeatherData(String city) async{
    http.Response weatherResp = await http.get(url);
    Map<String, dynamic> weatherMap = jsonDecode(weatherResp.body);
    return WeatherInfo(
        weatherMap['weather'][0]['id'],
        (weatherMap['main']['temp'] as double).floor(),
        weatherMap['name']
    );

  }

  @override
  Future<WeatherInfo> getWeatherInfo(LocationPos position) async {
    http.Response weatherResp = await http.get(url);
    Map<String, dynamic> weatherMap = jsonDecode(weatherResp.body);
    return WeatherInfo(
        weatherMap['weather'][0]['id'],
        (weatherMap['main']['temp'] as double).floor(),
        weatherMap['name']
    );
  }

  @override
  Future<WeatherInfo> getWeatherInfoForCity(CityInfo city) async {
    http.Response weatherResp = await http.get(url);
    Map<String, dynamic> weatherMap = jsonDecode(weatherResp.body);
    return WeatherInfo(
        weatherMap['weather'][0]['id'],
        (weatherMap['main']['temp'] as double).floor(),
        weatherMap['name']
    );
  }
}

//weatherMap['weather'][0]['id']

//weatherMap['main']['temp']

//weatherMap['name']