import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review_stats_model.g.dart';

@JsonSerializable()
class ReviewStatsModel {
  final int totalCount;
  final int fiveStars;
  final int fourStars;
  final int threeStars;
  final int twoStars;
  final int oneStars;

  ReviewStatsModel({
    required this.totalCount,
    required this.fiveStars,
    required this.fourStars,
    required this.threeStars,
    required this.twoStars,
    required this.oneStars,
  });

  factory ReviewStatsModel.fromJson(Map<String, dynamic> json) => _$ReviewStatsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewStatsModelToJson(this);
}

class ReviewStatsModelAdapter extends TypeAdapter<ReviewStatsModel> {
  @override
  final int typeId = 10;

  @override
  ReviewStatsModel read(BinaryReader reader) {
    return ReviewStatsModel(
      totalCount: reader.read(),
      fiveStars: reader.read(),
      fourStars: reader.read(),
      threeStars: reader.read(),
      twoStars: reader.read(),
      oneStars: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, ReviewStatsModel obj) {
    writer.writeInt(obj.totalCount);
    writer.writeInt(obj.fiveStars);
    writer.writeInt(obj.fourStars);
    writer.writeInt(obj.threeStars);
    writer.writeInt(obj.twoStars);
    writer.writeInt(obj.oneStars);
  }
}
