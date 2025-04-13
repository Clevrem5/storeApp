import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const String _tokenKey = "jwt_token";
  static const String _loginKey = "login";
  static const String _passwordKey = "password";
  static const String _emailKey = "email";
  static const String _codeKey = "code";
  static const _storage = FlutterSecureStorage();

  static Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  static Future<void> saveCredentials(String login, String password) async {
    await _storage.write(key: _loginKey, value: login);
    await _storage.write(key: _passwordKey, value: password);
  }

  static Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  static Future<Map<String, String?>> getCredentials() async {
    var credentials = {
      "login": await _storage.read(key: _loginKey),
      "password": await _storage.read(key: _passwordKey),
    };
    return credentials;
  }

  static Future<void> deleteCredentials() async {
    await _storage.delete(key: _loginKey);
    await _storage.delete(key: _passwordKey);
  }

  static Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
  }

//email
  static Future<void> saveEmail(String email) async {
    await _storage.write(key: _emailKey, value: email);
  }

  static Future<void> deleteEmail() async {
    await _storage.delete(key: _emailKey);
  }

  static Future<Map<String, String?>> getEmail() async {
    var email = {
      "email": await _storage.read(key: _emailKey),
    };
    return email;
  }

  //Code
  static Future<void> saveCode(String code) async {
    await _storage.write(key: _codeKey, value: code);
  }

  Future<void> deleteCode() async {
    await _storage.delete(key: _codeKey);
  }

  static Future<Map<String, String?>> getCode() async {
    var code = {
      "code": await _storage.read(key: _codeKey),
    };
    return code;
  }
}
