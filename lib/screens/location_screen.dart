import 'package:clima/domain/entity.dart';
import 'package:clima/domain/weather_use_case.dart';
import 'package:clima/mock/location_interactor_mock.dart';
import 'package:clima/mock/weather_interactor_mock.dart';
import 'package:clima/screens/components/weather_complex_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen() : super() {
    weatherUseCase.getWeatherInfoForLocation();
  }

  //Инициализация useCase с зависимостью
  final weatherUseCase = WeatherUseCase(WeatherInteractorMock(), LocationInteractorMock());

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext b_context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      widget.weatherUseCase.getWeatherInfoForLocation();
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),

                  StreamBuilder<bool>(
                    stream: widget.weatherUseCase.waitStream,
                    builder: (context, snapshot) {
                      if(snapshot.data == true)return SpinKitChasingDots(
                        color: Colors.white,
                      );
                      else return Container();
                    }
                  ),
                  FlatButton(
                    onPressed: () async {
                      final typedName = Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CityScreen()),
                      );

                      if (typedName != null)
                        widget.weatherUseCase
                            .getWeatherInfoForCity(CityInfo(await typedName));
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              new WeatherComplexComponent(
                weatherUseCase: widget.weatherUseCase,
              )
            ],
          ),
        ),
      ),
    );
  }
}
