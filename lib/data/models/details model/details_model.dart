import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/data/models/details%20model/product_images_model.dart';
part 'details_model.g.dart';
@JsonSerializable()
class DetailsModel {
  final int id;
  final String title;
  final String description;
  final int price;
  final bool isLiked;
  @ProductImagesConvertor()
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

class ProductImagesConvertor extends JsonConverter<ProductImagesModel, Map<String, dynamic>> {
  const ProductImagesConvertor();

  @override
  ProductImagesModel fromJson(Map<String, dynamic> json) {
    return ProductImagesModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(images) {
    return images.toJson();
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
