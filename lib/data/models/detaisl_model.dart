class DetailsModel {
  final int id;
  final String title;
  final String description;
  final int price;
  final bool isLiked;
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

  factory DetailsModel.fromJson(Map<String, dynamic> json) {
    return DetailsModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      isLiked: json['isLiked'],
      productImages: (json['productImages'] as List)
          .map((e) => ProductImagesModel.fromJson(e))
          .toList(),
      productSizes: json['productSizes'],
      reviewsCount: json['reviewsCount'],
      rating: (json['rating'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'isLiked': isLiked,
      'productImages': productImages.map((e) =>   ()).toList(),
      'productSizes': productSizes,
      'reviewsCount': reviewsCount,
      'rating': rating,
    };
  }
}


class ProductImagesModel {
  final int id;
  final String image;

  ProductImagesModel({
    required this.id,
    required this.image,

  });

  factory ProductImagesModel.fromJson(Map<String, dynamic> json) {
    return ProductImagesModel(id: json['id'], image: json['image']);
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
