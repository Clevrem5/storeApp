// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductFilter _$ProductFilterFromJson(Map<String, dynamic> json) =>
    _ProductFilter(
      categoryId: (json['categoryId'] as num?)?.toInt(),
      title: json['title'] as String?,
      sizeId: (json['sizeId'] as num?)?.toInt(),
      maxPrise: (json['maxPrise'] as num?)?.toDouble(),
      minPrice: (json['minPrice'] as num?)?.toDouble(),
      order: json['order'] as String?,
    );

Map<String, dynamic> _$ProductFilterToJson(_ProductFilter instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'title': instance.title,
      'sizeId': instance.sizeId,
      'maxPrise': instance.maxPrise,
      'minPrice': instance.minPrice,
      'order': instance.order,
    };
