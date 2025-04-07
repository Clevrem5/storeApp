import 'package:store_app/Data/client.dart';
import 'package:store_app/Data/models/Auth_model.dart';

import '../../Core/secure_storage.dart';

class SignUpRepository {
  final ApiClient client;

  SignUpRepository({required this.client});

  String? jwt;

  Future<bool> signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    final result = await client.signUp(
      AuthModel(
        fullName: fullName,
        email: email,
        password: password,
      ),
    );
    return result;
  }
  Future<void> logOut() async {
    await SecureStorage.deleteCredentials();
    await SecureStorage.deleteToken();
  }
  // Future<bool> refreshToken() async {
  //   var  credentials = await SecureStorage.getCredentials();
  //   if (credentials['login'] == null || credentials['password'] == null) {
  //     return false;
  //   }
  //   jwt = await client.
  // }
}
