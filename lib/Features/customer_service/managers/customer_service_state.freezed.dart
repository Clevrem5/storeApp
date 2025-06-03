// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_service_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomerServiceState {
  Status get status;
  List<Map<String, dynamic>> get messages;

  /// Create a copy of CustomerServiceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomerServiceStateCopyWith<CustomerServiceState> get copyWith =>
      _$CustomerServiceStateCopyWithImpl<CustomerServiceState>(
          this as CustomerServiceState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomerServiceState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.messages, messages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(messages));

  @override
  String toString() {
    return 'CustomerServiceState(status: $status, messages: $messages)';
  }
}

/// @nodoc
abstract mixin class $CustomerServiceStateCopyWith<$Res> {
  factory $CustomerServiceStateCopyWith(CustomerServiceState value,
          $Res Function(CustomerServiceState) _then) =
      _$CustomerServiceStateCopyWithImpl;
  @useResult
  $Res call({Status status, List<Map<String, dynamic>> messages});
}

/// @nodoc
class _$CustomerServiceStateCopyWithImpl<$Res>
    implements $CustomerServiceStateCopyWith<$Res> {
  _$CustomerServiceStateCopyWithImpl(this._self, this._then);

  final CustomerServiceState _self;
  final $Res Function(CustomerServiceState) _then;

  /// Create a copy of CustomerServiceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? messages = null,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      messages: null == messages
          ? _self.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _CustomerServiceState implements CustomerServiceState {
  const _CustomerServiceState(
      {required this.status,
      required final List<Map<String, dynamic>> messages})
      : _messages = messages;

  @override
  final Status status;
  final List<Map<String, dynamic>> _messages;
  @override
  List<Map<String, dynamic>> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  /// Create a copy of CustomerServiceState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CustomerServiceStateCopyWith<_CustomerServiceState> get copyWith =>
      __$CustomerServiceStateCopyWithImpl<_CustomerServiceState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomerServiceState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_messages));

  @override
  String toString() {
    return 'CustomerServiceState(status: $status, messages: $messages)';
  }
}

/// @nodoc
abstract mixin class _$CustomerServiceStateCopyWith<$Res>
    implements $CustomerServiceStateCopyWith<$Res> {
  factory _$CustomerServiceStateCopyWith(_CustomerServiceState value,
          $Res Function(_CustomerServiceState) _then) =
      __$CustomerServiceStateCopyWithImpl;
  @override
  @useResult
  $Res call({Status status, List<Map<String, dynamic>> messages});
}

/// @nodoc
class __$CustomerServiceStateCopyWithImpl<$Res>
    implements _$CustomerServiceStateCopyWith<$Res> {
  __$CustomerServiceStateCopyWithImpl(this._self, this._then);

  final _CustomerServiceState _self;
  final $Res Function(_CustomerServiceState) _then;

  /// Create a copy of CustomerServiceState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? messages = null,
  }) {
    return _then(_CustomerServiceState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      messages: null == messages
          ? _self._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

// dart format on
