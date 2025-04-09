sealed class HomePageEvent{}
final class HomePageLoad extends HomePageEvent{
  final int id;
  final String? searchTitle;
  HomePageLoad({required this.id, required this.searchTitle});
}