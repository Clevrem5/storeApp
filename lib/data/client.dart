import 'package:dio/dio.dart';
import 'package:store_app/Core/exceptions/custom_exception.dart';
import 'package:store_app/Core/inter_septor.dart';
import 'package:store_app/Data/models/Auth_model.dart';

class ApiClient {
  final Dio dio = Dio(
    BaseOptions(baseUrl: "http://192.168.11.58:8888/api/v1"),
  )..interceptors.add(AuthInterceptor());

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

  Future<bool> postResetEmail(String email) async {
    try {
      var response = await dio.post(
        "/auth/reset-password/email",
        data: {
          'email': email,
        },
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      throw Exception();
    }
  }

  Future<bool> postResetEmailCode(String email, String code) async {
    try {
      var response = await dio.post(
        "/auth/reset-password/verify",
        data: {
          'email': email,
          'code': code,
        },
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception("xato ketdi reset emailCode");
    }
  }

  Future<bool> postResetEmailCodeReset(
    String email,
    String code,
      String password,

      ) async {
    try {
      var response = await dio.post(
        "/auth/reset-password/reset",
        data: {
          'email': email,
          'code': code,
          'password': password,

        },
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception("xato ketdi reset emailCode");
    }
  }

  Future<List<dynamic>> fetchHomeProduct(int? categoryId) async {
    try {
      final response = await dio.get('/products/list?categoryId=2');
      if (response.statusCode == 200) {
        final List data = response.data as List;
        return data;
      } else {
        throw CustomException(message: "Xato: ${response.statusMessage ?? 'product kelmadi'}");
      }
    } catch (e) {
      throw CustomException(message: "API xatosi: ${e.toString()}");
    }
  }
  Future<bool>fetchSaveLike(int id)async{
    final response=await dio.post('/auth/save/$id');
    if (response.statusCode==200){
      return true;
    }else{
      return false;
      // throw CustomException(message: "Id saqlanmadi bratim");

    }
  }
  Future<bool>fetchUnSave(int id)async{
    final response=await dio.post('/auth/unsave/$id');
    if (response.statusCode==200){
      return true;
    }else{
      return false;
    }
  }
  Future<List<dynamic>>fetchSaveLiked()async{
    final response =await dio.get('/products/saved-products');
    if (response.statusCode==200){
      return List.from(response.data);
    }else{
      throw CustomException(message: "xato ma'lumot klemadi");
    }
  }
  Future<List<dynamic>> fetchCategories() async {
    final response = await dio.get('/categories/list');
    if (response.statusCode == 200) {
      return List.from(response.data);
    } else {
      throw CustomException(message: "Malumot Kelmadi");
    }
  }
}
