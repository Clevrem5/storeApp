// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SavedState {
  SavedStatus get status;
  List<ProductsModel> get saved;
  bool? get isSuccess;

  /// Create a copy of SavedState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SavedStateCopyWith<SavedState> get copyWith =>
      _$SavedStateCopyWithImpl<SavedState>(this as SavedState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SavedState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.saved, saved) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(saved), isSuccess);

  @override
  String toString() {
    return 'SavedState(status: $status, saved: $saved, isSuccess: $isSuccess)';
  }
}

/// @nodoc
abstract mixin class $SavedStateCopyWith<$Res> {
  factory $SavedStateCopyWith(
          SavedState value, $Res Function(SavedState) _then) =
      _$SavedStateCopyWithImpl;
  @useResult
  $Res call({SavedStatus status, List<ProductsModel> saved, bool? isSuccess});
}

/// @nodoc
class _$SavedStateCopyWithImpl<$Res> implements $SavedStateCopyWith<$Res> {
  _$SavedStateCopyWithImpl(this._self, this._then);

  final SavedState _self;
  final $Res Function(SavedState) _then;

  /// Create a copy of SavedState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? saved = null,
    Object? isSuccess = freezed,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as SavedStatus,
      saved: null == saved
          ? _self.saved
          : saved // ignore: cast_nullable_to_non_nullable
              as List<ProductsModel>,
      isSuccess: freezed == isSuccess
          ? _self.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _SavedState implements SavedState {
  const _SavedState(
      {required this.status,
      required final List<ProductsModel> saved,
      required this.isSuccess})
      : _saved = saved;

  @override
  final SavedStatus status;
  final List<ProductsModel> _saved;
  @override
  List<ProductsModel> get saved {
    if (_saved is EqualUnmodifiableListView) return _saved;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_saved);
  }

  @override
  final bool? isSuccess;

  /// Create a copy of SavedState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SavedStateCopyWith<_SavedState> get copyWith =>
      __$SavedStateCopyWithImpl<_SavedState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SavedState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._saved, _saved) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_saved), isSuccess);

  @override
  String toString() {
    return 'SavedState(status: $status, saved: $saved, isSuccess: $isSuccess)';
  }
}

/// @nodoc
abstract mixin class _$SavedStateCopyWith<$Res>
    implements $SavedStateCopyWith<$Res> {
  factory _$SavedStateCopyWith(
          _SavedState value, $Res Function(_SavedState) _then) =
      __$SavedStateCopyWithImpl;
  @override
  @useResult
  $Res call({SavedStatus status, List<ProductsModel> saved, bool? isSuccess});
}

/// @nodoc
class __$SavedStateCopyWithImpl<$Res> implements _$SavedStateCopyWith<$Res> {
  __$SavedStateCopyWithImpl(this._self, this._then);

  final _SavedState _self;
  final $Res Function(_SavedState) _then;

  /// Create a copy of SavedState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? saved = null,
    Object? isSuccess = freezed,
  }) {
    return _then(_SavedState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as SavedStatus,
      saved: null == saved
          ? _self._saved
          : saved // ignore: cast_nullable_to_non_nullable
              as List<ProductsModel>,
      isSuccess: freezed == isSuccess
          ? _self.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
