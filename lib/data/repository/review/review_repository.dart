import 'package:store_app/Data/client.dart';
import 'package:store_app/data/models/review_model/review_model.dart';

class ReviewRepository {
  final ApiClient client;

  ReviewRepository({required this.client});

  List<ReviewModel> review = [];
  ReviewCreateModel? createReview;

  Future<List<ReviewModel>> fetchReviews(int id) async {
    final rawReviews = await client.fetchReview(id);
    review = rawReviews.map((e) => ReviewModel.fromJson(e)).toList();
    return review;
  }

  Future<bool> fetchCreateReview({
    required String productId,
    required String rating,
    required String comment,
  }) async {
    final result = await client.fetchCreateReview(
      ReviewCreateModel(
        productId: productId,
        rating: rating,
        comment: comment,
      ),
    );
   return result;
  }
}
