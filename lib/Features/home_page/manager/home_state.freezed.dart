// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeState {
  List<ProductsModel> get product;
  List<ProductsModel> get saved;
  List<CategoriesModel> get categories;
  List<SizesModel> get sizes;
  HomeStatus get status;
  bool? get isSuccess;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeStateCopyWith<HomeState> get copyWith =>
      _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeState &&
            const DeepCollectionEquality().equals(other.product, product) &&
            const DeepCollectionEquality().equals(other.saved, saved) &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            const DeepCollectionEquality().equals(other.sizes, sizes) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(product),
      const DeepCollectionEquality().hash(saved),
      const DeepCollectionEquality().hash(categories),
      const DeepCollectionEquality().hash(sizes),
      status,
      isSuccess);

  @override
  String toString() {
    return 'HomeState(product: $product, saved: $saved, categories: $categories, sizes: $sizes, status: $status, isSuccess: $isSuccess)';
  }
}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) =
      _$HomeStateCopyWithImpl;
  @useResult
  $Res call(
      {List<ProductsModel> product,
      List<ProductsModel> saved,
      List<CategoriesModel> categories,
      List<SizesModel> sizes,
      HomeStatus status,
      bool? isSuccess});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? saved = null,
    Object? categories = null,
    Object? sizes = null,
    Object? status = null,
    Object? isSuccess = freezed,
  }) {
    return _then(_self.copyWith(
      product: null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as List<ProductsModel>,
      saved: null == saved
          ? _self.saved
          : saved // ignore: cast_nullable_to_non_nullable
              as List<ProductsModel>,
      categories: null == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoriesModel>,
      sizes: null == sizes
          ? _self.sizes
          : sizes // ignore: cast_nullable_to_non_nullable
              as List<SizesModel>,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as HomeStatus,
      isSuccess: freezed == isSuccess
          ? _self.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _HomeState implements HomeState {
  const _HomeState(
      {required final List<ProductsModel> product,
      required final List<ProductsModel> saved,
      required final List<CategoriesModel> categories,
      required final List<SizesModel> sizes,
      required this.status,
      required this.isSuccess})
      : _product = product,
        _saved = saved,
        _categories = categories,
        _sizes = sizes;

  final List<ProductsModel> _product;
  @override
  List<ProductsModel> get product {
    if (_product is EqualUnmodifiableListView) return _product;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_product);
  }

  final List<ProductsModel> _saved;
  @override
  List<ProductsModel> get saved {
    if (_saved is EqualUnmodifiableListView) return _saved;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_saved);
  }

  final List<CategoriesModel> _categories;
  @override
  List<CategoriesModel> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<SizesModel> _sizes;
  @override
  List<SizesModel> get sizes {
    if (_sizes is EqualUnmodifiableListView) return _sizes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sizes);
  }

  @override
  final HomeStatus status;
  @override
  final bool? isSuccess;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeState &&
            const DeepCollectionEquality().equals(other._product, _product) &&
            const DeepCollectionEquality().equals(other._saved, _saved) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._sizes, _sizes) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_product),
      const DeepCollectionEquality().hash(_saved),
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_sizes),
      status,
      isSuccess);

  @override
  String toString() {
    return 'HomeState(product: $product, saved: $saved, categories: $categories, sizes: $sizes, status: $status, isSuccess: $isSuccess)';
  }
}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(
          _HomeState value, $Res Function(_HomeState) _then) =
      __$HomeStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<ProductsModel> product,
      List<ProductsModel> saved,
      List<CategoriesModel> categories,
      List<SizesModel> sizes,
      HomeStatus status,
      bool? isSuccess});
}

/// @nodoc
class __$HomeStateCopyWithImpl<$Res> implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? product = null,
    Object? saved = null,
    Object? categories = null,
    Object? sizes = null,
    Object? status = null,
    Object? isSuccess = freezed,
  }) {
    return _then(_HomeState(
      product: null == product
          ? _self._product
          : product // ignore: cast_nullable_to_non_nullable
              as List<ProductsModel>,
      saved: null == saved
          ? _self._saved
          : saved // ignore: cast_nullable_to_non_nullable
              as List<ProductsModel>,
      categories: null == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoriesModel>,
      sizes: null == sizes
          ? _self._sizes
          : sizes // ignore: cast_nullable_to_non_nullable
              as List<SizesModel>,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as HomeStatus,
      isSuccess: freezed == isSuccess
          ? _self.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
