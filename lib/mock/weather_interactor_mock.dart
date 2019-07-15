import 'package:clima/domain/entity.dart';
import 'package:clima/domain/weather_interactor.dart';

class WeatherInteractorMock implements WeatherInteractor {
  @override
  Future<WeatherInfo> getWeatherInfo(LocationPos position) =>
      Future.delayed(Duration(seconds: 3))
        .then((_) =>WeatherInfo(500, 34, "TempCity")); //throw ("test data"));//WeatherInfo(500, 34, "TempCity"));

  @override
  Future<WeatherInfo> getWeatherInfoForCity(CityInfo city) =>
      Future.delayed(Duration(seconds: 3))
        .then((_) => WeatherInfo(800, 24, city.cityName));

}
