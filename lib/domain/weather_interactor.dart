import "package:clima/domain/entity.dart";

abstract class WeatherInteractor{
  Future<WeatherInfo> getWeatherInfo (LocationPos position);
  Future<WeatherInfo> getWeatherInfoForCity(CityInfo city);
}