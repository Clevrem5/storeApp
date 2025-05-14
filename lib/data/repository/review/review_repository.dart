import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:store_app/data/repository/review/review_repository_interface.dart';

import '../../models/review_model/review_model.dart';
import 'review_repository_local.dart';
import 'review_repository_remote.dart';

class ReviewRepository implements IReviewRepository {
  final ReviewRepositoryRemote remoteRepo;
  final ReviewRepositoryLocal localRepo;

  ReviewRepository({required this.remoteRepo, required this.localRepo});

  @override
  Future<List<ReviewModel>> fetchReviews(int id) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    final isOnline = connectivityResult.contains(ConnectivityResult.mobile) || connectivityResult.contains(ConnectivityResult.wifi);

    if (isOnline) {
      final reviews = await remoteRepo.fetchReviews(id);

      final box = localRepo.box;
      await box.clear();
      await box.addAll(reviews);

      return reviews;
    } else {
      return await localRepo.fetchReviews(id);
    }
  }

  @override
  Future<bool> fetchCreateReview({
    required String productId,
    required num rating,
    required String comment,
  }) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    final isOnline = connectivityResult.contains(ConnectivityResult.mobile) || connectivityResult.contains(ConnectivityResult.wifi);

    if (isOnline) {
      return await remoteRepo.fetchCreateReview(
        productId: productId,
        rating: rating,
        comment: comment,
      );
    } else {
      throw Exception("Internet mavjud emas. Fikr qoldirib bo‘lmaydi.");
    }
  }
}
