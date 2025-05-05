import 'package:freezed_annotation/freezed_annotation.dart';

part 'Auth_model.g.dart';

@JsonSerializable()
class AuthModel {
  final String fullName;
  final String email;
  final String password;

  AuthModel({
    required this.fullName,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() =>_$AuthModelToJson(this);
}
@JsonSerializable()
class AuthUpdateModel {
  final String gender;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String birthdate;

  AuthUpdateModel({
    required this.gender,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.birthdate,
  });

  Map<String, dynamic> toJson() =>_$AuthUpdateModelToJson(this);

}
