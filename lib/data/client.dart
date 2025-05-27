import 'package:dio/dio.dart';
import 'package:store_app/Core/exceptions/custom_exception.dart';
import 'package:store_app/Core/inter_septor.dart';
import 'package:store_app/data/models/cardModels/card_model.dart';
import 'package:store_app/data/models/review_model/review_model.dart';

import 'models/review_model/review_stats_model.dart';

class ApiClient {
  final Dio dio = Dio(
    BaseOptions(baseUrl: "http://192.168.10.11:8888/api/v1"),
  )..interceptors.add(AuthInterceptor());

  Future<bool> signUp(model) async {
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

  Future<bool> postResetEmailCodeReset(String email,
      String code,
      String password,) async {
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

  Future<List<dynamic>> fetchHomeProduct(Map<String, dynamic>? queryParam) async {
    try {
      final response = await dio.get(
        '/products/list',
        queryParameters: queryParam,
      );
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
  Future<List<dynamic>> fetchSearch(String? title) async {
    try {
      final response = await dio.get(
        '/products/list',
        queryParameters: {
          'Title': title,
        },
      );
      if (response.statusCode == 200) {
        final data = response.data;
        print("1111111111111 $data");

        if (data is List) {
          return data;
        } else {
          throw CustomException(message: "Noto‘g‘ri format: data list emas");
        }
      } else {
        throw CustomException(message: "Xato: ${response.statusMessage ?? 'product kelmadi'}");
      }
    } catch (e) {
      throw CustomException(message: "API xatosi: ${e.toString()}");
    }
  }

  Future<bool> fetchSaveLike(int id) async {
    final response = await dio.post('/auth/save/$id');
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
      // throw CustomException(message: "Id saqlanmadi bratim");
    }
  }

  Future<bool> fetchUnSave(int id) async {
    final response = await dio.post('/auth/unsave/$id');
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<dynamic>> fetchSaveLiked() async {
    final response = await dio.get('/products/saved-products');
    if (response.statusCode == 200) {
      return List.from(response.data);
    } else {
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

  Future<List<dynamic>> fetchSizes() async {
    final response = await dio.get('/sizes/list');
    if (response.statusCode == 200) {
      return List.from(response.data);
    } else {
      throw CustomException(message: "xato keldi!!!");
    }
  }

  Future<bool> fetchAuthUpdate(model) async {
    try {
      final response = await dio.patch(
        "/auth/update",
        data: model.toJson(),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<dynamic> fetchDetails(int id) async {
    final response = await dio.get('/products/detail/$id');
    if (response.statusCode == 200) {
      print(response.data);
      return response.data;
    } else {
      throw CustomException(message: "xato detailsdan ma'lumot kelamdi!!!");
    }
  }

  Future<List<dynamic>> fetchReview(int productId) async {
    final response = await dio.get('/reviews/list/$productId');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data;
    } else {
      throw CustomException(message: "xato keldi reviewsdan");
    }
  }

  Future<bool> fetchCreateReview(ReviewCreateModel model) async {
    final response = await dio.post(
      '/reviews/create',
      data: model.toJson(),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
      // throw CustomException(message: "salom");
    }
  }

  Future<List<dynamic>> fetchNotification() async {
    final response = await dio.get('/notifications/list');
    if (response.statusCode == 200) {
      return response.data as List;
    } else {
      throw CustomException(message: "xato ketdi notification");
    }
  }

  Future<ReviewStatsModel> fetchReviewStats(int productId) async {
    try {
      final response = await dio.get('/reviews/stats/$productId');
      if (response.statusCode == 200) {
        return ReviewStatsModel.fromJson(response.data);
      } else {
        throw CustomException(
          message: "Xato: ${response.statusMessage ?? 'Review statistikasi kelmadi'}",
        );
      }
    } catch (e) {
      throw CustomException(
        message: "API xatosi: ${e.toString()}",
      );
    }
  }

  Future<dynamic> fetchMyCart() async {
    final response = await dio.get("/my-cart/my-cart-items");
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Xato MyCart");
    }
  }

  Future<bool> fetchAddCart(int productId, int sizeId) async {
    final response = await dio.post(
      "/my-cart/add-item",
      data: {
        "productId": productId,
        "sizeId": sizeId,
      },
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  Future<List<dynamic>>fetchCards()async{
    final response =await dio.get('/cards/list');
    if (response.statusCode==200){
      final List<dynamic>data=List<dynamic>.from(response.data);
      return data;
    }
    else{
      throw CustomException(message: "xato ketdi");
    }
  }

  Future<CardCreateModel> fetchCreateCard(CardCreateModel model) async {
    final response = await dio.post(
      "/cards/create",
      data: model.toJson(),
    );
    if (response.statusCode==200){
      return model;
    }else{
      throw Exception('xato');
    }
  }

  Future<bool> fetchMyCartDelete(int id) async {
    final response = await dio.delete('/my-cart/delete/$id');
    if (response.statusCode == 204) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> fetchCardsDelete(int id) async {
    final response = await dio.delete('/cards/delete/$id');
    if (response.statusCode == 204) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> fetchOrdersDelete(int id) async {
    final response = await dio.delete('/orders/delete/$id');
    if (response.statusCode == 204) {
      return true;
    } else {
      return false;
    }
  }

}
