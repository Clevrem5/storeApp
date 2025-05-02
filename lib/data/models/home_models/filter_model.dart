import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_model.freezed.dart';

part 'filter_model.g.dart';

@freezed
abstract class ProductFilter with _$ProductFilter {
  const factory ProductFilter({
    required int? categoryId,
    required String? title,
    required int? sizeId,
    required double? maxPrise,
    required double? minPrice,
    required String? order,
  }) = _ProductFilter;

  factory ProductFilter.fromJson(Map<String,dynamic>json)=>_$ProductFilterFromJson(json);



}
