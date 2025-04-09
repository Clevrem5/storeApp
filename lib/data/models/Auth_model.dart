class AuthModel {
  final String fullName;
  final String email;
  final String password;

  AuthModel({
    required this.fullName,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "fullName": fullName,
      "email": email,
      "password": password,
    };
  }
}


class ResetData {

  final String email;
  final String code;

  ResetData({
    required this.email,
    required this.code,
  });
}
