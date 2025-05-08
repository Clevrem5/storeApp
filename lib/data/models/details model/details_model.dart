import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:store_app/data/models/details%20model/product_images_model.dart';
part 'details_model.g.dart';
@JsonSerializable()
class DetailsModel {
  final int id;
  final String title;
  final String description;
  final int price;
  final bool isLiked;
  @ListProductImagesConverter()
  final List<ProductImagesModel> productImages;
  final String? productSizes;
  final int reviewsCount;
  final double rating;


  DetailsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.isLiked,
    required this.productImages,
    this.productSizes,
    required this.reviewsCount,
    required this.rating,
  });


  factory DetailsModel.fromJson(Map<String, dynamic> json) => _$DetailsModelFromJson(json);

  // factory DetailsModel.fromJson(Map<String, dynamic> json) {
  //   return DetailsModel(
  //     id: json['id'],
  //     title: json['title'],
  //     description: json['description'],
  //     price: json['price'],
  //     isLiked: json['isLiked'],
  //     productImages: (json['productImages'] as List)
  //         .map((e) => ProductImagesModel.fromJson(e))
  //         .toList(),
  //     productSizes: json['productSizes'],
  //     reviewsCount: json['reviewsCount'],
  //     rating: (json['rating'] as num).toDouble(),
  //   );
  // }

  Map<String, dynamic> toJson() =>_$DetailsModelToJson(this);
}

class ListProductImagesConverter extends JsonConverter<List<ProductImagesModel>, List<dynamic>> {
  const ListProductImagesConverter();

  @override
  List<ProductImagesModel> fromJson(List<dynamic> json) {
    return json.map((e) => ProductImagesModel.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  List<dynamic> toJson(List<ProductImagesModel> images) {
    return images.map((e) => e.toJson()).toList();
  }
}


class DetailsAdapter extends TypeAdapter<DetailsModel> {
  @override
  int get typeId => 4;

  @override
  DetailsModel read(BinaryReader reader) {
    return DetailsModel(
      id: reader.readInt(),
      title: reader.read(),
      description: reader.read(),
      price: reader.read(),
      isLiked: reader.read(),
      productImages: reader.read(),
      productSizes: reader.read(), // null bo‘lsa ham o‘qiladi
      reviewsCount: reader.read(),
      rating: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, DetailsModel obj) {
    writer.write(obj.id);
    writer.write(obj.title);
    writer.write(obj.description);
    writer.write(obj.price);
    writer.write(obj.isLiked);
    writer.write(obj.productImages);
    writer.write(obj.productSizes); // null bo‘lsa ham yoziladi
    writer.write(obj.reviewsCount);
    writer.write(obj.rating);
  }
}

// class ProductSizesModel {
//   final int id;
//   final String title;
//
//   ProductSizesModel({
//     required this.id,
//     required this.title,
//   });
//
//   factory ProductSizesModel.fromJson(Map<String, dynamic> json) {
//     return ProductSizesModel(id: json['id'], title: json['title']);
//   }
// }
