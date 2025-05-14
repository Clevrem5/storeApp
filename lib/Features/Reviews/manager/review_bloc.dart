import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/Core/exceptions/custom_exception.dart';
import 'package:store_app/Features/Reviews/manager/review_state.dart';
import 'package:store_app/data/repository/review/review_repository_interface.dart';

part 'review_event.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  final IReviewRepository _repo;

  ReviewBloc({required IReviewRepository repo})
      : _repo = repo,
        super(ReviewState.initial()) {
    on<ReviewLoad>(_loadReviews);
    on<ReviewCreate>(_createReview);
  }

  Future<void> _loadReviews(ReviewLoad event, Emitter<ReviewState> emit) async {
    try {
      emit(state.copyWith(status: ReviewStatus.loading));
      final reviews = await _repo.fetchReviews(event.productId);
      emit(state.copyWith(reviews: reviews, status: ReviewStatus.success));
    } on Exception catch (e) {
      emit(state.copyWith(status: ReviewStatus.failure));
      throw CustomException(message: e.toString());
    }
  }

  Future<void> _createReview(ReviewCreate event, Emitter<ReviewState> emit) async {
    try {
      emit(state.copyWith(status: ReviewStatus.loading));
      final success = await _repo.fetchCreateReview(
        productId: event.productId,
        rating: event.rating,
        comment: event.comment,
      );

      if (success) {
        final updated = await _repo.fetchReviews(int.parse(event.productId));
        emit(state.copyWith(reviews: updated, status: ReviewStatus.success));
      } else {
        emit(state.copyWith(status: ReviewStatus.failure));
      }
    } on Exception catch (e) {
      emit(state.copyWith(status: ReviewStatus.failure));
      throw CustomException(message: e.toString());
    }
  }
}
