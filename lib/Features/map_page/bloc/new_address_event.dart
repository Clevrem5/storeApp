
import 'package:latlong2/latlong.dart';

sealed class NewAddressEvent {}

final class GoToCurrentLocation extends NewAddressEvent{}

final class NewAddressChooseLocation extends NewAddressEvent{
  final LatLng chosenLocation;

  NewAddressChooseLocation({required this.chosenLocation});
}