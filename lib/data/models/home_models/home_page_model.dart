import 'package:hive/hive.dart';

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

  @override
  String toString() {
    return 'ProductsModel :( $id ,$discount,$image,$title, $price,$isLiked,)';
  }
}

class ProductsAdapter extends TypeAdapter<ProductsModel> {
  @override
  int get typeId => 3;

  @override
  void write(BinaryWriter writer, ProductsModel obj) {
    writer.write(obj.id);
    writer.write(obj.discount);
    writer.write(obj.image);
    writer.write(obj.title);
    writer.write(obj.price);
    writer.write(obj.isLiked);
  }

  @override
  ProductsModel read(BinaryReader reader) {
    return ProductsModel(
      id: reader.read(),
      discount: reader.read(),
      image: reader.read(),
      title: reader.read(),
      price: reader.read(),
      isLiked: reader.read(),

    );
  }
}
