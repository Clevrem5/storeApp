// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailsModel _$DetailsModelFromJson(Map<String, dynamic> json) => DetailsModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toInt(),
      isLiked: json['isLiked'] as bool,
      productImages: const ListProductImagesConverter()
          .fromJson(json['productImages'] as List),
      productSizes: json['productSizes'] as String?,
      reviewsCount: (json['reviewsCount'] as num).toInt(),
      rating: (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$DetailsModelToJson(DetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'isLiked': instance.isLiked,
      'productImages':
          const ListProductImagesConverter().toJson(instance.productImages),
      'productSizes': instance.productSizes,
      'reviewsCount': instance.reviewsCount,
      'rating': instance.rating,
    };
