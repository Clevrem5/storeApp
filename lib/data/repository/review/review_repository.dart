import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:store_app/data/models/review_model/review_model.dart';
import 'package:store_app/data/models/review_model/review_stats_model.dart';
import 'package:store_app/data/repository/review/review_repository_interface.dart';
import 'package:store_app/data/repository/review/review_repository_local.dart';
import 'package:store_app/data/repository/review/review_repository_remote.dart';

class ReviewRepository implements IReviewRepository {
  final ReviewRepositoryRemote remoteRepo;
  final ReviewRepositoryLocal localRepo;

  ReviewRepository({
    required this.remoteRepo,
    required this.localRepo,
  });

  @override
  Future<List<ReviewModel>> fetchReviews(int productId) async {
    final connection = await Connectivity().checkConnectivity();
    final isOnline = connection.contains(ConnectivityResult.mobile) || connection.contains(ConnectivityResult.wifi);

    if (isOnline) {
      return await remoteRepo.fetchReviews(productId);
    } else {
      return await localRepo.fetchReviews(productId);
    }
  }

  @override
  Future<bool> fetchCreateReview({
    required String productId,
    required num rating,
    required String comment,
  }) async {
    final connection = await Connectivity().checkConnectivity();
    final isOnline = connection.contains(ConnectivityResult.mobile) || connection.contains(ConnectivityResult.wifi);

    if (isOnline) {
      return await remoteRepo.fetchCreateReview(
        productId: productId,
        rating: rating,
        comment: comment,
      );
    } else {
      throw Exception("Internet mavjud emas. Fikr qoldirib bo'lmaydi.");
    }
  }

  @override
  Future<ReviewStatsModel> fetchReviewStats(int productId) async {
    final connection = await Connectivity().checkConnectivity();
    final isOnline = connection.contains(ConnectivityResult.mobile) || connection.contains(ConnectivityResult.wifi);

    if (isOnline) {
      return await remoteRepo.fetchReviewStats(productId);
    } else {
      return await localRepo.fetchReviewStats(productId);
    }
  }
}
