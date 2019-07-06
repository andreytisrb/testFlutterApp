
import 'package:clima/domain/entity.dart';
import 'package:clima/utilities/locator.dart';
import 'package:geolocator/geolocator.dart';

class LocationService{
  final Location _location = Location();

  Future<LocationPos> getPosition() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      return LocationPos(position.latitude, position.longitude);
    }catch(e) {
      print(e);
      return LocationPos(-1, -1);
    }

  }

}