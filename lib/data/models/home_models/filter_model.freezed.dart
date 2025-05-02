// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductFilter {
  int? get categoryId;
  String? get title;
  int? get sizeId;
  double? get maxPrise;
  double? get minPrice;
  String? get order;

  /// Create a copy of ProductFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductFilterCopyWith<ProductFilter> get copyWith =>
      _$ProductFilterCopyWithImpl<ProductFilter>(
          this as ProductFilter, _$identity);

  /// Serializes this ProductFilter to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductFilter &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.sizeId, sizeId) || other.sizeId == sizeId) &&
            (identical(other.maxPrise, maxPrise) ||
                other.maxPrise == maxPrise) &&
            (identical(other.minPrice, minPrice) ||
                other.minPrice == minPrice) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, categoryId, title, sizeId, maxPrise, minPrice, order);

  @override
  String toString() {
    return 'ProductFilter(categoryId: $categoryId, title: $title, sizeId: $sizeId, maxPrise: $maxPrise, minPrice: $minPrice, order: $order)';
  }
}

/// @nodoc
abstract mixin class $ProductFilterCopyWith<$Res> {
  factory $ProductFilterCopyWith(
          ProductFilter value, $Res Function(ProductFilter) _then) =
      _$ProductFilterCopyWithImpl;
  @useResult
  $Res call(
      {int? categoryId,
      String? title,
      int? sizeId,
      double? maxPrise,
      double? minPrice,
      String? order});
}

/// @nodoc
class _$ProductFilterCopyWithImpl<$Res>
    implements $ProductFilterCopyWith<$Res> {
  _$ProductFilterCopyWithImpl(this._self, this._then);

  final ProductFilter _self;
  final $Res Function(ProductFilter) _then;

  /// Create a copy of ProductFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
    Object? title = freezed,
    Object? sizeId = freezed,
    Object? maxPrise = freezed,
    Object? minPrice = freezed,
    Object? order = freezed,
  }) {
    return _then(_self.copyWith(
      categoryId: freezed == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      sizeId: freezed == sizeId
          ? _self.sizeId
          : sizeId // ignore: cast_nullable_to_non_nullable
              as int?,
      maxPrise: freezed == maxPrise
          ? _self.maxPrise
          : maxPrise // ignore: cast_nullable_to_non_nullable
              as double?,
      minPrice: freezed == minPrice
          ? _self.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      order: freezed == order
          ? _self.order
          : order // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ProductFilter implements ProductFilter {
  const _ProductFilter(
      {required this.categoryId,
      required this.title,
      required this.sizeId,
      required this.maxPrise,
      required this.minPrice,
      required this.order});
  factory _ProductFilter.fromJson(Map<String, dynamic> json) =>
      _$ProductFilterFromJson(json);

  @override
  final int? categoryId;
  @override
  final String? title;
  @override
  final int? sizeId;
  @override
  final double? maxPrise;
  @override
  final double? minPrice;
  @override
  final String? order;

  /// Create a copy of ProductFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductFilterCopyWith<_ProductFilter> get copyWith =>
      __$ProductFilterCopyWithImpl<_ProductFilter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProductFilterToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductFilter &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.sizeId, sizeId) || other.sizeId == sizeId) &&
            (identical(other.maxPrise, maxPrise) ||
                other.maxPrise == maxPrise) &&
            (identical(other.minPrice, minPrice) ||
                other.minPrice == minPrice) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, categoryId, title, sizeId, maxPrise, minPrice, order);

  @override
  String toString() {
    return 'ProductFilter(categoryId: $categoryId, title: $title, sizeId: $sizeId, maxPrise: $maxPrise, minPrice: $minPrice, order: $order)';
  }
}

/// @nodoc
abstract mixin class _$ProductFilterCopyWith<$Res>
    implements $ProductFilterCopyWith<$Res> {
  factory _$ProductFilterCopyWith(
          _ProductFilter value, $Res Function(_ProductFilter) _then) =
      __$ProductFilterCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? categoryId,
      String? title,
      int? sizeId,
      double? maxPrise,
      double? minPrice,
      String? order});
}

/// @nodoc
class __$ProductFilterCopyWithImpl<$Res>
    implements _$ProductFilterCopyWith<$Res> {
  __$ProductFilterCopyWithImpl(this._self, this._then);

  final _ProductFilter _self;
  final $Res Function(_ProductFilter) _then;

  /// Create a copy of ProductFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? categoryId = freezed,
    Object? title = freezed,
    Object? sizeId = freezed,
    Object? maxPrise = freezed,
    Object? minPrice = freezed,
    Object? order = freezed,
  }) {
    return _then(_ProductFilter(
      categoryId: freezed == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      sizeId: freezed == sizeId
          ? _self.sizeId
          : sizeId // ignore: cast_nullable_to_non_nullable
              as int?,
      maxPrise: freezed == maxPrise
          ? _self.maxPrise
          : maxPrise // ignore: cast_nullable_to_non_nullable
              as double?,
      minPrice: freezed == minPrice
          ? _self.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      order: freezed == order
          ? _self.order
          : order // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
