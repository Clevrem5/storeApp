import 'package:store_app/data/client.dart';
import 'package:store_app/data/models/review_model/review_model.dart';
import 'package:store_app/data/repository/review/review_repository_interface.dart';

class ReviewRepositoryRemote implements IReviewRepository {
  final ApiClient client;

  ReviewRepositoryRemote({required this.client});

  List<ReviewModel> reviews = [];

  @override
  Future<List<ReviewModel>> fetchReviews(int id) async {
    final rawReviews = await client.fetchReview(id);
    reviews = rawReviews.map((e) => ReviewModel.fromJson(e)).toList();
    return reviews;
  }

  @override
  Future<bool> fetchCreateReview({
    required String productId,
    required num rating,
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
