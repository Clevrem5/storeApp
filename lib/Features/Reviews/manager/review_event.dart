part of 'review_bloc.dart';

abstract class ReviewEvent {}

class ReviewLoad extends ReviewEvent {
  final int productId;
  ReviewLoad({required this.productId});
}

class ReviewCreate extends ReviewEvent {
  final String productId;
  final num rating;
  final String comment;

  ReviewCreate({
    required this.productId,
    required this.rating,
    required this.comment,
  });
}
