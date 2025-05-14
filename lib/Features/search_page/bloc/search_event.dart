sealed class SearchEvent {}

final class SearchLoading extends SearchEvent {
  final String? title;

  SearchLoading({
    required this.title,
  });
}

final class SearchClearHistory extends SearchEvent {}


final class SearchDeleteItem extends SearchEvent {
  final String title;

  SearchDeleteItem(this.title);
}
