import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_cart_items.g.dart';

@JsonSerializable()
class MyCartItemsModel {
  final int id;
  final num price;
  final num quantity;
  final String image;
  @JsonKey(defaultValue: "L")
  final String size;
  final String title;

  MyCartItemsModel({
    required this.id,
    required this.price,
    required this.quantity,
    required this.image,
    required this.size,
    required this.title,
  });

  factory MyCartItemsModel.fromJson(Map<String, dynamic> json) => _$MyCartItemsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyCartItemsModelToJson(this);

}

/*
"items": [
    {
      "id": 0,
      "title": "string",
      "size": "string",
      "price": 0,
      "image": "string",
      "quantity": 0
    }
  ]
  */
