import 'package:clima/domain/entity.dart';
import 'package:clima/domain/weather_use_case.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WeatherComplexComponent extends StatefulWidget {
  final WeatherUseCase weatherUseCase;

  const WeatherComplexComponent( {@required this.weatherUseCase,
    Key key,
  }) : super(key: key);


  @override
  StatefulElement createElement() {
    return super.createElement();
  }

  @override
  _WeatherComplexComponentState createState() =>
      _WeatherComplexComponentState();
}

class _WeatherComplexComponentState extends State<WeatherComplexComponent> {
  bool refreshing = true;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<WeatherInfo>(
      stream: widget.weatherUseCase.weatherStream(),
      builder: (context, snapshot) {
//        if(snapshot.hasError){
//          final snackBar = SnackBar(content: Text('Error occure while get weather!'));
//          Scaffold.of(context).showSnackBar(snackBar);
//
//        }
        return Expanded(
          child: Stack(
            children: [
              if (snapshot.hasData)
                new WeatherWidget(weatherInfo: snapshot.data)
              else
                Center(
                  child: SpinKitChasingDots(
                    color: Colors.white,
                  ),
                )
            ],
          ),
        );
      }
    );
  }
}

class WeatherWidget extends StatelessWidget {

  final WeatherInfo weatherInfo;
  const WeatherWidget({
    Key key, this.weatherInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Row(
            children: <Widget>[
              Text(
                '${weatherInfo.temperature}°',
                style: kTempTextStyle,
              ),
              Text(
                '☀️',
                style: kConditionTextStyle,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 15.0),
          child: Text(
            "It's 🍦 time in San Francisco!",
            textAlign: TextAlign.center,
            style: kMessageTextStyle,
          ),
        ),
      ],
    );
  }
}
