part of 'details_bloc.dart';

sealed class DetailsEvent {}

final class DetailsLoad extends DetailsEvent {
  final int id;

  DetailsLoad({required this.id});
}
