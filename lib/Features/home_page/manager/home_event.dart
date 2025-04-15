part of 'home_bloc.dart';

sealed class HomeEvent {}

final class HomeLoad extends HomeEvent {
  // final int selectedId;
  // HomeLoad({required this.selectedId});
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