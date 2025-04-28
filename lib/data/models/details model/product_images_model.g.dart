// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_images_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductImagesModel _$ProductImagesModelFromJson(Map<String, dynamic> json) =>
    ProductImagesModel(
      id: (json['id'] as num).toInt(),
      image: json['image'] as String,
    );

Map<String, dynamic> _$ProductImagesModelToJson(ProductImagesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
    };
