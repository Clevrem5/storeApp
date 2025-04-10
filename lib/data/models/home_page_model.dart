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
}
