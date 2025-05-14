// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DetailsState {
  DetailsStatus get status;
  DetailsModel? get details;
  bool? get success;

  /// Create a copy of DetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DetailsStateCopyWith<DetailsState> get copyWith =>
      _$DetailsStateCopyWithImpl<DetailsState>(
          this as DetailsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DetailsState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.success, success) || other.success == success));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, details, success);

  @override
  String toString() {
    return 'DetailsState(status: $status, details: $details, success: $success)';
  }
}

/// @nodoc
abstract mixin class $DetailsStateCopyWith<$Res> {
  factory $DetailsStateCopyWith(
          DetailsState value, $Res Function(DetailsState) _then) =
      _$DetailsStateCopyWithImpl;
  @useResult
  $Res call({DetailsStatus status, DetailsModel? details, bool? success});
}

/// @nodoc
class _$DetailsStateCopyWithImpl<$Res> implements $DetailsStateCopyWith<$Res> {
  _$DetailsStateCopyWithImpl(this._self, this._then);

  final DetailsState _self;
  final $Res Function(DetailsState) _then;

  /// Create a copy of DetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? details = freezed,
    Object? success = freezed,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as DetailsStatus,
      details: freezed == details
          ? _self.details
          : details // ignore: cast_nullable_to_non_nullable
              as DetailsModel?,
      success: freezed == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _DetailsState implements DetailsState {
  const _DetailsState(
      {required this.status, required this.details, required this.success});

  @override
  final DetailsStatus status;
  @override
  final DetailsModel? details;
  @override
  final bool? success;

  /// Create a copy of DetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DetailsStateCopyWith<_DetailsState> get copyWith =>
      __$DetailsStateCopyWithImpl<_DetailsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DetailsState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.success, success) || other.success == success));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, details, success);

  @override
  String toString() {
    return 'DetailsState(status: $status, details: $details, success: $success)';
  }
}

/// @nodoc
abstract mixin class _$DetailsStateCopyWith<$Res>
    implements $DetailsStateCopyWith<$Res> {
  factory _$DetailsStateCopyWith(
          _DetailsState value, $Res Function(_DetailsState) _then) =
      __$DetailsStateCopyWithImpl;
  @override
  @useResult
  $Res call({DetailsStatus status, DetailsModel? details, bool? success});
}

/// @nodoc
class __$DetailsStateCopyWithImpl<$Res>
    implements _$DetailsStateCopyWith<$Res> {
  __$DetailsStateCopyWithImpl(this._self, this._then);

  final _DetailsState _self;
  final $Res Function(_DetailsState) _then;

  /// Create a copy of DetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? details = freezed,
    Object? success = freezed,
  }) {
    return _then(_DetailsState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as DetailsStatus,
      details: freezed == details
          ? _self.details
          : details // ignore: cast_nullable_to_non_nullable
              as DetailsModel?,
      success: freezed == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
