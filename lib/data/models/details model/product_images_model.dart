import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

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

class ProductImagesAdapter extends TypeAdapter<ProductImagesModel> {
  @override
  int get typeId => 5;

  @override
  ProductImagesModel read(BinaryReader reader) {
   return ProductImagesModel(
      id: reader.read(),
      image: reader.read(),
    );
  }
  @override
  void write(BinaryWriter writer, ProductImagesModel obj) {
    writer.write(obj.id);
    writer.write(obj.image);
  }
}
