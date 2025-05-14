import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'review_model.g.dart';

@JsonSerializable()
class ReviewModel {
  final int id;
  final String comment;
  final num rating;
  final DateTime created;
  final String userFullName;

  ReviewModel({
    required this.id,
    required this.comment,
    required this.rating,
    required this.created,
    required this.userFullName,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) => _$ReviewModelFromJson(json);
}

class ReviewModelAdapter extends TypeAdapter<ReviewModel> {
  @override
  final int typeId = 1;

  @override
  ReviewModel read(BinaryReader reader) {
    return ReviewModel(
      id: reader.readInt(),
      comment: reader.readString(),
      rating: reader.readDouble(),
      created: DateTime.parse(reader.readString()),
      userFullName: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, ReviewModel obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.comment);
    writer.writeDouble(obj.rating.toDouble());
    writer.writeString(obj.created.toIso8601String());
    writer.writeString(obj.userFullName);
  }
}

@JsonSerializable()
class ReviewCreateModel {
  final String productId;
  final num rating;
  final String comment;

  ReviewCreateModel({
    required this.productId,
    required this.rating,
    required this.comment,
  });

  Map<String, dynamic> toJson() => _$ReviewCreateModelToJson(this);
}
