import 'package:freezed_annotation/freezed_annotation.dart';

part 'size_model.g.dart';

@JsonSerializable()

class SizesModel {
  final int id;
  final String title;

  const SizesModel({
    required this.id,
    required this.title,
  });


  factory SizesModel.fromJson(Map<String, dynamic> json) =>_$SizesModelFromJson(json);
  Map<String, dynamic> toJson() =>_$SizesModelToJson(this);

  SizesModel copyWith({
    int? id,
    String? title,
  }) {
    return SizesModel(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }
}
