class ProductsModel {
  final int id, discount;
  final String image, title;
  final num price;
  final bool isLiked;

  const ProductsModel({
    required this.id,
    required this.discount,
    required this.image,
    required this.title,
    required this.isLiked,
    required this.price,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json['id'],
      discount: json['discount'],
      image: json['image'],
      title: json['title'],
      isLiked: json['isLiked'],
      price: json['price'],
    );
  }

  ProductsModel copyWith({
    int? id,
    int? discount,
    String? image,
    String? title,
    num? price,
    bool? isLiked,
  }) {
    return ProductsModel(
      id: id ?? this.id,
      discount: discount ?? this.discount,
      image: image ?? this.image,
      title: title ?? this.title,
      price: price ?? this.price,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}
class CategoriesModel {
  final int id;
  final String title;

  const CategoriesModel({
    required this.id,
    required this.title,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      id: json['id'],
      title: json['title'],
    );
  }

  CategoriesModel copyWith({
    int? id,
    String? title,
  }) {
    return CategoriesModel(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }
}
