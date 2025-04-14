part of 'home_bloc.dart';

sealed class HomeEvent{}

final class HomeLoad extends HomeEvent{
  final int selectedId;
  HomeLoad({required this.selectedId});

}
