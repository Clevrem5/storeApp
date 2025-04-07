import 'package:dio/dio.dart';
import 'package:store_app/Data/models/Auth_model.dart';

class ApiClient {
  final Dio dio = Dio(
    BaseOptions(baseUrl: "http://192.168.9.45:8888/api/v1"),
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
}
