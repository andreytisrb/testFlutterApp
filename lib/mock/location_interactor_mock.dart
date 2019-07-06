
import 'package:clima/domain/entity.dart';
import 'package:clima/domain/location_interactor.dart';

class LocationInteractorMock implements LocationInteractor{
  @override
  Future<LocationPos> getLocation() =>
      Future.delayed(Duration(seconds: 3))
      .then((_)=> LocationPos(1.0, 1.0));
}