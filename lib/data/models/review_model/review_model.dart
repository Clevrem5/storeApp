
import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_model.g.dart';

@JsonSerializable()
class ReviewModel {
  final int id;
  final String comment;
  final DateTime created;
  final String userFullName;

  ReviewModel({
    required this.id,
    required this.comment,
    required this.created,
    required this.userFullName,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>_$ReviewModelFromJson(json);
  Map<String, dynamic> toJson() =>_$ReviewModelToJson(this);
}
@JsonSerializable()
class ReviewCreateModel {
  final String productId;
  final String rating;
  final String comment;

  ReviewCreateModel({
    required this.productId,
    required this.rating,
    required this.comment,
  });
  factory ReviewCreateModel.fromJson(Map<String,dynamic>json)=>_$ReviewCreateModelFromJson(json);
  Map<String, dynamic> toJson() =>_$ReviewCreateModelToJson(this);
}
