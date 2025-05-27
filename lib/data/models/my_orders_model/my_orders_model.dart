class MyOrdersModel {
  final int id;
  final String title;
  final String image;
  final String size;
  final num price;
  final String status;

  MyOrdersModel({
    required this.id,
    required this.title,
    required this.image,
    required this.size,
    required this.price,
    required this.status,
  });

  factory MyOrdersModel.fromJson(Map<String, dynamic> json) {
    return MyOrdersModel(
      id: json['id'] as int,
      title: json['title'] as String,
      image: json['image'] as String,
      size: json['size'] as String,
      price: json['price'] as num,
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'size': size,
      'price': price,
      'status': status,
    };
  }
}
