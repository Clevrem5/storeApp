import 'package:store_app/Data/client.dart';
import 'package:store_app/Data/models/Auth_model.dart';

import '../../Core/secure_storage.dart';

class AuthRepository {
  final ApiClient client;

  AuthRepository({required this.client});

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

  Future<bool> login(String login, String password) async {
    jwt = await client.login(login, password);
    await SecureStorage.deleteCredentials();
    await SecureStorage.deleteToken();
    await SecureStorage.saveToken(jwt!);
    await SecureStorage.saveCredentials(login, password);
    return true;
  }

  Future<void> logOut() async {
    await SecureStorage.deleteCredentials();
    await SecureStorage.deleteToken();
  }
  Future<bool> refreshToken() async {
    var  credentials = await SecureStorage.getCredentials();
    if (credentials['login'] == null || credentials['password'] == null) {
      return false;
    }
    jwt = await client.login(credentials['login']!, credentials['password']!);
    await SecureStorage.deleteToken();
    SecureStorage.saveToken(jwt!);
    return true;
  }
}
