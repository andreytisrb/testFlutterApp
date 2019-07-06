import 'package:clima/services/networking.dart';
import 'package:clima/utilities/locator.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  Future initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            WeatherNetwork netw = WeatherNetwork();
            netw.getWeatherData("Moscow").then(
                    (onValue){
                  print(onValue.cityName);
                }
            );
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
