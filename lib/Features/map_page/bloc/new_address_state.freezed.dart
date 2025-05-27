// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_address_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewAddressState {
  LatLng? get currentLocation;
  String? get address;
  List<Marker> get markers;
  NewAddressStatus get status;

  /// Create a copy of NewAddressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NewAddressStateCopyWith<NewAddressState> get copyWith =>
      _$NewAddressStateCopyWithImpl<NewAddressState>(
          this as NewAddressState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NewAddressState &&
            (identical(other.currentLocation, currentLocation) ||
                other.currentLocation == currentLocation) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality().equals(other.markers, markers) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentLocation, address,
      const DeepCollectionEquality().hash(markers), status);

  @override
  String toString() {
    return 'NewAddressState(currentLocation: $currentLocation, address: $address, markers: $markers, status: $status)';
  }
}

/// @nodoc
abstract mixin class $NewAddressStateCopyWith<$Res> {
  factory $NewAddressStateCopyWith(
          NewAddressState value, $Res Function(NewAddressState) _then) =
      _$NewAddressStateCopyWithImpl;
  @useResult
  $Res call(
      {LatLng? currentLocation,
      String? address,
      List<Marker> markers,
      NewAddressStatus status});
}

/// @nodoc
class _$NewAddressStateCopyWithImpl<$Res>
    implements $NewAddressStateCopyWith<$Res> {
  _$NewAddressStateCopyWithImpl(this._self, this._then);

  final NewAddressState _self;
  final $Res Function(NewAddressState) _then;

  /// Create a copy of NewAddressState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentLocation = freezed,
    Object? address = freezed,
    Object? markers = null,
    Object? status = null,
  }) {
    return _then(_self.copyWith(
      currentLocation: freezed == currentLocation
          ? _self.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      markers: null == markers
          ? _self.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as List<Marker>,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as NewAddressStatus,
    ));
  }
}

/// @nodoc

class _NewAddressState implements NewAddressState {
  const _NewAddressState(
      {required this.currentLocation,
      required this.address,
      required final List<Marker> markers,
      required this.status})
      : _markers = markers;

  @override
  final LatLng? currentLocation;
  @override
  final String? address;
  final List<Marker> _markers;
  @override
  List<Marker> get markers {
    if (_markers is EqualUnmodifiableListView) return _markers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_markers);
  }

  @override
  final NewAddressStatus status;

  /// Create a copy of NewAddressState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NewAddressStateCopyWith<_NewAddressState> get copyWith =>
      __$NewAddressStateCopyWithImpl<_NewAddressState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NewAddressState &&
            (identical(other.currentLocation, currentLocation) ||
                other.currentLocation == currentLocation) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality().equals(other._markers, _markers) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentLocation, address,
      const DeepCollectionEquality().hash(_markers), status);

  @override
  String toString() {
    return 'NewAddressState(currentLocation: $currentLocation, address: $address, markers: $markers, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$NewAddressStateCopyWith<$Res>
    implements $NewAddressStateCopyWith<$Res> {
  factory _$NewAddressStateCopyWith(
          _NewAddressState value, $Res Function(_NewAddressState) _then) =
      __$NewAddressStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {LatLng? currentLocation,
      String? address,
      List<Marker> markers,
      NewAddressStatus status});
}

/// @nodoc
class __$NewAddressStateCopyWithImpl<$Res>
    implements _$NewAddressStateCopyWith<$Res> {
  __$NewAddressStateCopyWithImpl(this._self, this._then);

  final _NewAddressState _self;
  final $Res Function(_NewAddressState) _then;

  /// Create a copy of NewAddressState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentLocation = freezed,
    Object? address = freezed,
    Object? markers = null,
    Object? status = null,
  }) {
    return _then(_NewAddressState(
      currentLocation: freezed == currentLocation
          ? _self.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      markers: null == markers
          ? _self._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as List<Marker>,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as NewAddressStatus,
    ));
  }
}

// dart format on
