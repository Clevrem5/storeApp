class DetailsModel {
  final int id;
  final String description, title;
  final num price;
  final bool isLiked;
  final num reviewsCount, rating;
  // final List<ProductImagesModel> productImages;
  // final List<ProductSizesModel> productSizes;

  DetailsModel({
    required this.id,
    required this.description,
    required this.title,
    required this.price,
    required this.isLiked,
    required this.rating,
    required this.reviewsCount,
    // required this.productImages,
    // required this.productSizes,
  });

  factory DetailsModel.fromJson(Map<String, dynamic> json) {
    return DetailsModel(
      id: json['id'],
      description: json['description'],
      title: json['title'],
      price: json['price'],
      isLiked: json['isLiked'],
      rating: json['rating'],
      reviewsCount: json['reviewsCount'],
      // productImages: (json['productImages'] as List).map((e) => ProductImagesModel.fromJson(e)).toList(),
      // productSizes: (json['productSizes'] as List).map((e) => ProductSizesModel.fromJson(e)).toList(),
    );
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

class ProductSizesModel {
  final int id;
  final String title;

  ProductSizesModel({
    required this.id,
    required this.title,
  });

  factory ProductSizesModel.fromJson(Map<String, dynamic> json) {
    return ProductSizesModel(id: json['id'], title: json['title']);
  }
}
