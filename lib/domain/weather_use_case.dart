import 'dart:async';

import 'package:clima/domain/entity.dart';
import 'package:clima/domain/location_interactor.dart';
import 'package:clima/domain/weather_interactor.dart';

class WeatherUseCase {
  final StreamController _streamController = StreamController<WeatherInfo>();
  final StreamController _waitController = StreamController<bool>();
  WeatherInteractor _weatherInteractor;
  LocationInteractor _locationInteractor;

  WeatherUseCase(this._weatherInteractor, this._locationInteractor);

  Stream<WeatherInfo> get weatherStream => _streamController.stream;
  Stream<bool> get waitStream => _waitController.stream;


  Future getWeatherInfoForLocation() async {
    _waitController.sink.add(true);
    final res = _getWeatherInfo(await _locationInteractor.getLocation());
    _waitController.sink.add(false);
    return res;

  }

  Future _getWeatherInfo(LocationPos position) async =>
      _weatherInteractor
          .getWeatherInfo(position)
          .then((onValue) => _streamController.sink.add(onValue))
          .catchError((error) => _streamController.sink.addError(error));

  getWeatherInfoForCity(CityInfo city) async {
    _waitController.sink.add(true);
    final res =_streamController.sink
        .add(
        await _weatherInteractor.getWeatherInfoForCity(city)
    );
    _waitController.sink.add(false);
    return res;
  }
}
