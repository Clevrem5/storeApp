import 'package:hive/hive.dart';
import 'package:store_app/data/client.dart';
import 'package:store_app/data/models/review_model/review_model.dart';
import 'package:store_app/data/models/review_model/review_stats_model.dart';
import 'package:store_app/data/repository/review/review_repository_interface.dart';

class ReviewRepositoryRemote implements IReviewRepository {
  final ApiClient client;

  ReviewRepositoryRemote({required this.client});

  @override
  Future<List<ReviewModel>> fetchReviews(int productId) async {
    final rawReviews = await client.fetchReview(productId);
    final reviews = rawReviews.map((e) => ReviewModel.fromJson(e)).toList();

    final box = Hive.box<ReviewModel>("reviews");
    await box.clear();
    await box.addAll(reviews);

    return reviews;
  }

  @override
  Future<bool> fetchCreateReview({
    required String productId,
    required num rating,
    required String comment,
  }) async {
    return await client.fetchCreateReview(
      ReviewCreateModel(
        productId: productId,
        rating: rating,
        comment: comment,
      ),
    );
  }

  @override
  Future<ReviewStatsModel> fetchReviewStats(int productId) async {
    return await client.fetchReviewStats(productId);
  }
}
