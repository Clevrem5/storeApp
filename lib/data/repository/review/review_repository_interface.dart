import '../../models/review_model/review_model.dart';

abstract interface class IReviewRepository {
  Future<List<ReviewModel>> fetchReviews(int id);
  Future<bool> fetchCreateReview({
    required String productId,
    required num rating,
    required String comment,
  });
}
