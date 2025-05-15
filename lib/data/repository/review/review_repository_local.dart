import 'package:hive/hive.dart';
import 'package:store_app/data/models/review_model/review_model.dart';
import 'package:store_app/data/models/review_model/review_stats_model.dart';
import 'package:store_app/data/repository/review/review_repository_interface.dart';

class ReviewRepositoryLocal implements IReviewRepository {
  final Box<ReviewModel> box = Hive.box<ReviewModel>("reviews");

  @override
  Future<List<ReviewModel>> fetchReviews(int productId) async {
    return box.values
        .where((review) => review.id == productId.toString())
        .toList();
  }

  @override
  Future<bool> fetchCreateReview({
    required String productId,
    required num rating,
    required String comment,
  }) async {
    throw UnimplementedError("Offline rejimda sharh qo'shib bo'lmaydi.");
  }

  @override
  Future<ReviewStatsModel> fetchReviewStats(int productId) async {
    throw UnimplementedError("Offline rejimda statistikani olish mumkin emas.");
  }
}
