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

  Map<String, dynamic> toJson() {
    return {
      "gender": gender,
      'fullName': fullName,
      "email": email,
      'phoneNumber': phoneNumber,
      'birthdate': birthdate,
    };
  }

}
