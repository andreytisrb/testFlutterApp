
class LocationPos{
  final double longitude;
  final double latitude;

  LocationPos(this.longitude, this.latitude);
}

class CityInfo{
  final String cityName;

  CityInfo(this.cityName);
}

class WeatherInfo{
  final int condition;
  final int temperature;
  final String cityName;

  WeatherInfo(this.condition, this.temperature, this.cityName);


}