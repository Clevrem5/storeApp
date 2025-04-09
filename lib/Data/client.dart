import 'package:dio/dio.dart';
import 'package:store_app/Data/models/Auth_model.dart';

class ApiClient {
  final Dio dio = Dio(
    BaseOptions(baseUrl: "http://192.168.9.139:8888/api/v1"),
  );

  Future<bool> signUp(AuthModel model) async {
    final response = await dio.post(
      '/auth/register',
      data: model.toJson(),
    );
    print("malumot bor ${response.data}");
    return response.statusCode == 201 ? true : false;
  }

  Future<String> login(String login, String password) async {
    var response = await dio.post(
      "/auth/login",
      data: {"login": login, "password": password},
    );
    if (response.statusCode == 200) {
      var data = Map<String, String>.from(response.data);
      return data['accessToken']!;
    } else {
      throw Exception("Nimadir xato ketdi");
    }
  }

  Future<String> postResetEmail(String email) async {
    var response = await dio.post(
      "/auth/reset-password/email",
      data: {
        'email': email,
      },
    );
    if (response.statusCode == 200) {
      final data = Map<String, String>.from(response.data);
      return data['email']!;
    } else {
      throw Exception("xato ketdi reset email");
    }
  }

  Future<ResetData> postResetEmailCode(String email, String code) async {
    var response = await dio.post(
      "/auth/reset-password/verify",
      data: {
        'email': email,
        'code': code,
      },
    );
    if (response.statusCode == 200) {
      return ResetData(email: email, code: code);
    } else {
      throw Exception("xato ketdi reset emailCode");
    }
  }

  Future<void> postResetEmailCodeReset(
    String email,
    String code,
    String password,
  ) async {
    var response = await dio.post(
      "/auth/reset-password/reset",
      data: {
        'email': email,
        'password': password,
        'code': code,
      },
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("xato ketdi reset emailCode");
    }
  }
  
  Future<List<dynamic>> fetchHomePage(int categoryId, String? searchTitle) async {
    var response = await dio.get('/products/list?Title=$searchTitle&CategoryId=2');
    if (response.statusCode == 200) {
      return List<dynamic>.from(response.data);
    } else {
      throw Exception('malumot kelmadi qanday chunding');
    }
  }
}
