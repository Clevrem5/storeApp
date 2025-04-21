sealed class SavedEvent{}

final class SavedLoad extends SavedEvent{}

final class SavedLikesEvent extends SavedEvent {
  final int id;

  SavedLikesEvent({required this.id});
}