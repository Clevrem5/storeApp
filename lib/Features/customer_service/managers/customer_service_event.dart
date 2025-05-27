part of 'customer_service_bloc.dart';

sealed class CustomerServiceEvents {}

final class CustomerServiceMessageSend extends CustomerServiceEvents {
  final String message;

  CustomerServiceMessageSend({required this.message});
}

final class CustomerServiceMessageReceived extends CustomerServiceEvents {
  final Map<String, dynamic> message;

  CustomerServiceMessageReceived({required this.message});
}
