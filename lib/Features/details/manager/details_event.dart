part of 'details_bloc.dart';

sealed class DetailsEvent {}

final class DetailsLoad extends DetailsEvent {
  final int id;

  DetailsLoad({required this.id});
}

final class AddCart extends DetailsEvent {
  final int productId;
  final int sizeId;

  AddCart({required this.productId, required this.sizeId});
}
