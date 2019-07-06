import 'dart:async';

import 'package:clima/domain/entity.dart';
import 'package:clima/domain/weather_interactor.dart';

class WeatherUseCase {
  final StreamController _streamController = StreamController<WeatherInfo>();
  WeatherInteractor _weatherInteractor;

  Stream<WeatherInfo> weatherStream() => _streamController.stream;

  WeatherUseCase(this._weatherInteractor);

  Future getWeatherInfo(LocationPos position) async => _weatherInteractor
      .getWeatherInfo(position)
      .then((onValue) => _streamController.sink.add(onValue))
      .catchError((error) => _streamController.sink.addError(error));

  getWeatherInfoForCity(CityInfo city) async => _streamController.sink
      .add(await _weatherInteractor.getWeatherInfoForCity(city));
}
