import 'package:store_app/data/models/review_model/review_model.dart';
import 'package:store_app/data/models/review_model/review_stats_model.dart';

abstract interface class IReviewRepository {
  Future<List<ReviewModel>> fetchReviews(int productId);
  Future<bool> fetchCreateReview({
    required String productId,
    required num rating,
    required String comment,
  });
  Future<ReviewStatsModel> fetchReviewStats(int productId);
}
