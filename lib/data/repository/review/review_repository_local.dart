import 'package:hive/hive.dart';
import 'package:store_app/data/repository/review/review_repository_interface.dart';

import '../../models/review_model/review_model.dart';

class ReviewRepositoryLocal implements IReviewRepository {
  final Box<ReviewModel> box = Hive.box<ReviewModel>("reviews");

  @override
  Future<List<ReviewModel>> fetchReviews(int id) async {
    // Optional: mahsulot ID bo‘yicha filtr qilish
    final allReviews = box.values.where((review) => review.id == id.toString()).toList();
    return allReviews;
  }

  @override
  Future<bool> fetchCreateReview({
    required String productId,
    required num rating,
    required String comment,
  }) async {
    throw UnimplementedError("Offline rejimda sharh (review) qoldirib bo‘lmaydi.");
  }
}
