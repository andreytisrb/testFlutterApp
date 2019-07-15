import 'dart:async';

import 'package:clima/domain/entity.dart';
import 'package:clima/domain/location_interactor.dart';
import 'package:clima/domain/weather_interactor.dart';

class WeatherUseCase {
  final StreamController _streamController = StreamController<WeatherInfo>();
  WeatherInteractor _weatherInteractor;
  LocationInteractor _locationInteractor;

  WeatherUseCase(this._weatherInteractor, this._locationInteractor);

  Stream<WeatherInfo> weatherStream() => _streamController.stream;

  Future getWeatherInfoForLocation() async =>
      _getWeatherInfo(await _locationInteractor.getLocation());

  Future _getWeatherInfo(LocationPos position) async =>
      _weatherInteractor
          .getWeatherInfo(position)
          .then((onValue) => _streamController.sink.add(onValue))
          .catchError((error) => _streamController.sink.addError(error));

  getWeatherInfoForCity(CityInfo city) async =>
      _streamController.sink
          .add(
          await _weatherInteractor.getWeatherInfoForCity(city)
      );
}
