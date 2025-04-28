// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) => AuthModel(
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$AuthModelToJson(AuthModel instance) => <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'password': instance.password,
    };

AuthUpdateModel _$AuthUpdateModelFromJson(Map<String, dynamic> json) =>
    AuthUpdateModel(
      gender: json['gender'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      birthdate: json['birthdate'] as String,
    );

Map<String, dynamic> _$AuthUpdateModelToJson(AuthUpdateModel instance) =>
    <String, dynamic>{
      'gender': instance.gender,
      'fullName': instance.fullName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'birthdate': instance.birthdate,
    };
