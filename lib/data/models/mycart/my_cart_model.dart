
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/data/models/mycart/my_cart_items.dart';

import 'my_cart_convertor.dart';

part 'my_cart_model.g.dart';

@JsonSerializable()
class MyCartModel {
  @MyCartItemsConvertor()
  final List<MyCartItemsModel> items;
  final num subTotal;
  final num vat;
  final num shippingFee;
  final num total;

  MyCartModel({
    required this.subTotal,
    required this.items,
    required this.vat,
    required this.shippingFee,
    required this.total,
  });

  factory MyCartModel.fromJson(Map<String, dynamic> json) => _$MyCartModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyCartModelToJson(this);
}


/*
* {
  "items": [
    {
      "id": 0,
      "title": "string",
      "size": "string",
      "price": 0,
      "image": "string",
      "quantity": 0
    }
  ],
  "subTotal": 0,
  "vat": 0,
  "shippingFee": 0,
  "total": 0*/
