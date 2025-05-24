// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MyCartState {
  MyCartModel? get data;
  MyCartStatus get status;
  List<MyCartItemsModel> get items;

  /// Create a copy of MyCartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MyCartStateCopyWith<MyCartState> get copyWith =>
      _$MyCartStateCopyWithImpl<MyCartState>(this as MyCartState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MyCartState &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, data, status, const DeepCollectionEquality().hash(items));

  @override
  String toString() {
    return 'MyCartState(data: $data, status: $status, items: $items)';
  }
}

/// @nodoc
abstract mixin class $MyCartStateCopyWith<$Res> {
  factory $MyCartStateCopyWith(
          MyCartState value, $Res Function(MyCartState) _then) =
      _$MyCartStateCopyWithImpl;
  @useResult
  $Res call(
      {MyCartModel? data, MyCartStatus status, List<MyCartItemsModel> items});
}

/// @nodoc
class _$MyCartStateCopyWithImpl<$Res> implements $MyCartStateCopyWith<$Res> {
  _$MyCartStateCopyWithImpl(this._self, this._then);

  final MyCartState _self;
  final $Res Function(MyCartState) _then;

  /// Create a copy of MyCartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? status = null,
    Object? items = null,
  }) {
    return _then(_self.copyWith(
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as MyCartModel?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as MyCartStatus,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MyCartItemsModel>,
    ));
  }
}

/// @nodoc

class _MyCartState implements MyCartState {
  const _MyCartState(
      {required this.data,
      required this.status,
      required final List<MyCartItemsModel> items})
      : _items = items;

  @override
  final MyCartModel? data;
  @override
  final MyCartStatus status;
  final List<MyCartItemsModel> _items;
  @override
  List<MyCartItemsModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// Create a copy of MyCartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MyCartStateCopyWith<_MyCartState> get copyWith =>
      __$MyCartStateCopyWithImpl<_MyCartState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MyCartState &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, data, status, const DeepCollectionEquality().hash(_items));

  @override
  String toString() {
    return 'MyCartState(data: $data, status: $status, items: $items)';
  }
}

/// @nodoc
abstract mixin class _$MyCartStateCopyWith<$Res>
    implements $MyCartStateCopyWith<$Res> {
  factory _$MyCartStateCopyWith(
          _MyCartState value, $Res Function(_MyCartState) _then) =
      __$MyCartStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {MyCartModel? data, MyCartStatus status, List<MyCartItemsModel> items});
}

/// @nodoc
class __$MyCartStateCopyWithImpl<$Res> implements _$MyCartStateCopyWith<$Res> {
  __$MyCartStateCopyWithImpl(this._self, this._then);

  final _MyCartState _self;
  final $Res Function(_MyCartState) _then;

  /// Create a copy of MyCartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
    Object? status = null,
    Object? items = null,
  }) {
    return _then(_MyCartState(
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as MyCartModel?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as MyCartStatus,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MyCartItemsModel>,
    ));
  }
}

// dart format on
