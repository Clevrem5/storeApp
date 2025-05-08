import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:store_app/data/models/mycart/my_cart_model.dart';

import 'my_cart_items.dart';

class MyCartItemsConvertor extends Converter<List<MyCartItemsModel>, List<Map<String, dynamic>>> {
  const MyCartItemsConvertor();

  List<MyCartItemsModel> fromJson(List<Map<String, dynamic>> json) {
    return json.map((e) => MyCartItemsModel.fromJson(e)).toList();
  }

  List<Map<String, dynamic>> toJson(List<MyCartItemsModel> items) {
    return items.map((e) => e.toJson()).toList();
  }

  @override
  List<Map<String, dynamic>> convert(List<MyCartItemsModel> input) {
    throw UnimplementedError();
  }
}

class MyCartAdapter extends TypeAdapter<MyCartModel> {
  @override
  int get typeId => 7;

  @override
  MyCartModel read(BinaryReader reader) {
    return MyCartModel(
      subTotal: reader.read(),
      items: reader.read(),
      vat: reader.read(),
      shippingFee: reader.read(),
      total: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, MyCartModel obj) {
    writer.write(obj.subTotal);
    writer.write(obj.items);
    writer.write(obj.vat);
    writer.write(obj.shippingFee);
    writer.write(obj.total);
  }
}

class MyCartItemsAdapter extends TypeAdapter<MyCartItemsModel> {
  @override
  int get typeId => 8;

  @override
  MyCartItemsModel read(BinaryReader reader) {
    return MyCartItemsModel(
      id: reader.read(),
      price: reader.read(),
      quantity: reader.read(),
      image: reader.read(),
      size: reader.read(),
      title: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, MyCartItemsModel obj) {
    writer.write(obj.title);
    writer.write(obj.size);
    writer.write(obj.image);
    writer.write(obj.price);
    writer.write(obj.id);
    writer.write(obj.quantity);
  }
}
