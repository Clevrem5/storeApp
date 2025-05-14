// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => ReviewModel(
      id: (json['id'] as num).toInt(),
      comment: json['comment'] as String,
      rating: json['rating'] as num,
      created: DateTime.parse(json['created'] as String),
      userFullName: json['userFullName'] as String,
    );

Map<String, dynamic> _$ReviewModelToJson(ReviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'comment': instance.comment,
      'rating': instance.rating,
      'created': instance.created.toIso8601String(),
      'userFullName': instance.userFullName,
    };

ReviewCreateModel _$ReviewCreateModelFromJson(Map<String, dynamic> json) =>
    ReviewCreateModel(
      productId: json['productId'] as String,
      rating: json['rating'] as num,
      comment: json['comment'] as String,
    );

Map<String, dynamic> _$ReviewCreateModelToJson(ReviewCreateModel instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'rating': instance.rating,
      'comment': instance.comment,
    };
