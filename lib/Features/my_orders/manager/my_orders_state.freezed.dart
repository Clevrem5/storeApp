// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_orders_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MyOrdersState {
  MyOrdersStatus get status;
  List<MyOrdersModel> get orders;

  /// Create a copy of MyOrdersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MyOrdersStateCopyWith<MyOrdersState> get copyWith =>
      _$MyOrdersStateCopyWithImpl<MyOrdersState>(
          this as MyOrdersState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MyOrdersState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.orders, orders));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(orders));

  @override
  String toString() {
    return 'MyOrdersState(status: $status, orders: $orders)';
  }
}

/// @nodoc
abstract mixin class $MyOrdersStateCopyWith<$Res> {
  factory $MyOrdersStateCopyWith(
          MyOrdersState value, $Res Function(MyOrdersState) _then) =
      _$MyOrdersStateCopyWithImpl;
  @useResult
  $Res call({MyOrdersStatus status, List<MyOrdersModel> orders});
}

/// @nodoc
class _$MyOrdersStateCopyWithImpl<$Res>
    implements $MyOrdersStateCopyWith<$Res> {
  _$MyOrdersStateCopyWithImpl(this._self, this._then);

  final MyOrdersState _self;
  final $Res Function(MyOrdersState) _then;

  /// Create a copy of MyOrdersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? orders = null,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as MyOrdersStatus,
      orders: null == orders
          ? _self.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<MyOrdersModel>,
    ));
  }
}

/// @nodoc

class _MyOrdersState implements MyOrdersState {
  const _MyOrdersState(
      {required this.status, required final List<MyOrdersModel> orders})
      : _orders = orders;

  @override
  final MyOrdersStatus status;
  final List<MyOrdersModel> _orders;
  @override
  List<MyOrdersModel> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  /// Create a copy of MyOrdersState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MyOrdersStateCopyWith<_MyOrdersState> get copyWith =>
      __$MyOrdersStateCopyWithImpl<_MyOrdersState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MyOrdersState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._orders, _orders));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_orders));

  @override
  String toString() {
    return 'MyOrdersState(status: $status, orders: $orders)';
  }
}

/// @nodoc
abstract mixin class _$MyOrdersStateCopyWith<$Res>
    implements $MyOrdersStateCopyWith<$Res> {
  factory _$MyOrdersStateCopyWith(
          _MyOrdersState value, $Res Function(_MyOrdersState) _then) =
      __$MyOrdersStateCopyWithImpl;
  @override
  @useResult
  $Res call({MyOrdersStatus status, List<MyOrdersModel> orders});
}

/// @nodoc
class __$MyOrdersStateCopyWithImpl<$Res>
    implements _$MyOrdersStateCopyWith<$Res> {
  __$MyOrdersStateCopyWithImpl(this._self, this._then);

  final _MyOrdersState _self;
  final $Res Function(_MyOrdersState) _then;

  /// Create a copy of MyOrdersState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? orders = null,
  }) {
    return _then(_MyOrdersState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as MyOrdersStatus,
      orders: null == orders
          ? _self._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<MyOrdersModel>,
    ));
  }
}

// dart format on
