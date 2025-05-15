// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewStatsModel _$ReviewStatsModelFromJson(Map<String, dynamic> json) =>
    ReviewStatsModel(
      totalCount: (json['totalCount'] as num).toInt(),
      fiveStars: (json['fiveStars'] as num).toInt(),
      fourStars: (json['fourStars'] as num).toInt(),
      threeStars: (json['threeStars'] as num).toInt(),
      twoStars: (json['twoStars'] as num).toInt(),
      oneStars: (json['oneStars'] as num).toInt(),
    );

Map<String, dynamic> _$ReviewStatsModelToJson(ReviewStatsModel instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'fiveStars': instance.fiveStars,
      'fourStars': instance.fourStars,
      'threeStars': instance.threeStars,
      'twoStars': instance.twoStars,
      'oneStars': instance.oneStars,
    };
