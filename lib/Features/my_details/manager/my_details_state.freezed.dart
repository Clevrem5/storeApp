// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MyDetailsState {
  MyDetailsStatus get status;

  /// Create a copy of MyDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MyDetailsStateCopyWith<MyDetailsState> get copyWith =>
      _$MyDetailsStateCopyWithImpl<MyDetailsState>(
          this as MyDetailsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MyDetailsState &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @override
  String toString() {
    return 'MyDetailsState(status: $status)';
  }
}

/// @nodoc
abstract mixin class $MyDetailsStateCopyWith<$Res> {
  factory $MyDetailsStateCopyWith(
          MyDetailsState value, $Res Function(MyDetailsState) _then) =
      _$MyDetailsStateCopyWithImpl;
  @useResult
  $Res call({MyDetailsStatus status});
}

/// @nodoc
class _$MyDetailsStateCopyWithImpl<$Res>
    implements $MyDetailsStateCopyWith<$Res> {
  _$MyDetailsStateCopyWithImpl(this._self, this._then);

  final MyDetailsState _self;
  final $Res Function(MyDetailsState) _then;

  /// Create a copy of MyDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as MyDetailsStatus,
    ));
  }
}

/// @nodoc

class _MyDetailsState implements MyDetailsState {
  const _MyDetailsState({required this.status});

  @override
  final MyDetailsStatus status;

  /// Create a copy of MyDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MyDetailsStateCopyWith<_MyDetailsState> get copyWith =>
      __$MyDetailsStateCopyWithImpl<_MyDetailsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MyDetailsState &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @override
  String toString() {
    return 'MyDetailsState(status: $status)';
  }
}

/// @nodoc
abstract mixin class _$MyDetailsStateCopyWith<$Res>
    implements $MyDetailsStateCopyWith<$Res> {
  factory _$MyDetailsStateCopyWith(
          _MyDetailsState value, $Res Function(_MyDetailsState) _then) =
      __$MyDetailsStateCopyWithImpl;
  @override
  @useResult
  $Res call({MyDetailsStatus status});
}

/// @nodoc
class __$MyDetailsStateCopyWithImpl<$Res>
    implements _$MyDetailsStateCopyWith<$Res> {
  __$MyDetailsStateCopyWithImpl(this._self, this._then);

  final _MyDetailsState _self;
  final $Res Function(_MyDetailsState) _then;

  /// Create a copy of MyDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
  }) {
    return _then(_MyDetailsState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as MyDetailsStatus,
    ));
  }
}

// dart format on
