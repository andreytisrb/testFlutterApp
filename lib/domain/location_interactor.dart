
import 'entity.dart';

abstract class LocationInteractor{
  Future<LocationPos> getLocation();
}