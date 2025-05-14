import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/data/models/review_model/review_model.dart';

part 'review_state.freezed.dart';

enum ReviewStatus { initial, loading, success, failure }

@freezed
abstract class ReviewState with _$ReviewState {
  const factory ReviewState({
    @Default(<ReviewModel>[]) List<ReviewModel> reviews,
    @Default(ReviewStatus.initial) ReviewStatus status,
  }) = _ReviewState;

  factory ReviewState.initial() => const ReviewState();
}
