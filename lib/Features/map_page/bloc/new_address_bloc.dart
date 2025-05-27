import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';

import 'new_address_event.dart';
import 'new_address_state.dart';

class NewAddressBloc extends Bloc<NewAddressEvent, NewAddressState> {
  NewAddressBloc() : super(NewAddressState.initial()) {
    on<GoToCurrentLocation>(_onGoToCurrentLocation);
    on<NewAddressChooseLocation>(_onChooseLocation);
  }

  final controller = MapController();

  Future<void> _onGoToCurrentLocation(
      GoToCurrentLocation event, Emitter<NewAddressState> emit) async {
    var status = await Permission.locationWhenInUse.status;

    if (status.isDenied) {
      status = await Permission.locationWhenInUse.request();
    }

    if (status.isPermanentlyDenied) {
      await openAppSettings();
    }

    if (status.isGranted) {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: AndroidSettings(accuracy: LocationAccuracy.best),
      );

      final currentPosition = LatLng(position.latitude, position.longitude);
      controller.move(currentPosition, controller.camera.zoom);
      emit(
        state.copyWith(
          currentLocation: currentPosition,
          markers: [
            Marker(
              point: currentPosition,
              width: 40.w,
              height: 40.h,
              child: Icon(Icons.location_on),
            ),
          ],
        ),
      );

      final placeMarks = await placemarkFromCoordinates(
        currentPosition.latitude,
        currentPosition.longitude,
      );

      if (placeMarks.isNotEmpty) {
        Placemark p = placeMarks.first;

        final addressString =
            "${p.country},${p.administrativeArea},${p.locality},${p.street},${p.name}";

        emit(state.copyWith(address: addressString));
      }
    }
  }

  Future<void> _onChooseLocation(
      NewAddressChooseLocation event, Emitter<NewAddressState> emit) async {
    controller.move(event.chosenLocation, controller.camera.zoom);

    emit(
      state.copyWith(
        currentLocation: event.chosenLocation,
        markers: [
          Marker(
            point: event.chosenLocation,
            width: 40.w,
            height: 40.h,
            child: Icon(Icons.location_on),
          ),
        ],
      ),
    );

    List<Placemark> placeMarks = await placemarkFromCoordinates(
      event.chosenLocation.latitude,
      event.chosenLocation.longitude,
    );

    if (placeMarks.isNotEmpty) {
      Placemark place = placeMarks.first;
      final addressString =
          "${place.country},${place.administrativeArea},${place.locality},${place.street},${place.name}";
      emit(state.copyWith(address: addressString));
    }
    emit(state.copyWith(status: NewAddressStatus.selected));
    emit(state.copyWith(status: NewAddressStatus.idle));
  }
}
