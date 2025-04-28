import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_images_model.g.dart';

@JsonSerializable()
class ProductImagesModel {
  final int id;
  final String image;

  ProductImagesModel({
    required this.id,
    required this.image,
  });

  factory ProductImagesModel.fromJson(Map<String, dynamic> json) => _$ProductImagesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductImagesModelToJson(this);
}
