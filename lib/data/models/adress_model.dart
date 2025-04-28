import 'package:freezed_annotation/freezed_annotation.dart';

part 'adress_model.g.dart';

@JsonSerializable()
class Address {
  final String title, bio;

  Address({required this.title, required this.bio,});
  factory Address.fromJson(Map<String,dynamic>json)=>_$AddressFromJson(json);
  Map<String,dynamic>toJson()=>_$AddressToJson(this);
}
