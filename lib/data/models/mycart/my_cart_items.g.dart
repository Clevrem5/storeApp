// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_cart_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyCartItemsModel _$MyCartItemsModelFromJson(Map<String, dynamic> json) =>
    MyCartItemsModel(
      id: (json['id'] as num).toInt(),
      price: json['price'] as num,
      quantity: json['quantity'] as num,
      image: json['image'] as String,
      size: json['size'] as String? ?? 'L',
      title: json['title'] as String,
    );

Map<String, dynamic> _$MyCartItemsModelToJson(MyCartItemsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'quantity': instance.quantity,
      'image': instance.image,
      'size': instance.size,
      'title': instance.title,
    };
