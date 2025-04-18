part of 'home_bloc.dart';

sealed class HomeEvent {}

final class HomeLoad extends HomeEvent {
  final String? title;
  final int? categoryId;
  final int? sizeId;
  final double? maxPrice;
  final double? minPrice;
  final String? orderBy;
  HomeLoad({
    this.title,
    this.categoryId,
    this.sizeId,
    this.minPrice,
    this.maxPrice,
    this.orderBy,
  });
}


final class LikeSaveEvent extends HomeEvent {
  final int likeId;

  LikeSaveEvent({
    required this.likeId,
  });
}

final class LikeUnSaveEvent extends HomeEvent {
  final int unLikeId;

  LikeUnSaveEvent({
    required this.unLikeId,
  });

}
final class SaveLoadEvent extends HomeEvent{}