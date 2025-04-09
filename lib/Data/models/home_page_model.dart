class ProductsModel {
  final int id, discount;
  final String image, title;
  final num price;
  final bool isLiked;

  const ProductsModel({
    required this.title,
    required this.isLiked,
    required this.image,
    required this.id,
    required this.price,
    required this.discount,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      title: json['title'],
      isLiked: json['isLiked'],
      image: json['image'],
      id: json['id'],
      price: json['price'],
      discount: json['discount'],
    );
  }
}
