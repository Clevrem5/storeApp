sealed class MyCartEvent {}

final class MyCartLoad extends MyCartEvent {}

final class MyCartDelete extends MyCartEvent{
  final int id;
  MyCartDelete({required this.id});
}
