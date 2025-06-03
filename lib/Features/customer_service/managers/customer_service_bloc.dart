import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/Features/customer_service/managers/customer_service_state.dart';
import 'package:web_socket_channel/status.dart' as websocket_status;
import 'package:web_socket_channel/web_socket_channel.dart';

part 'customer_service_event.dart';

class CustomerServiceBloc extends Bloc<CustomerServiceEvents, CustomerServiceState> {
  CustomerServiceBloc() : super(CustomerServiceState.initial()) {
    on<CustomerServiceMessageReceived>(_onMessageReceived);
    on<CustomerServiceMessageSend>(_onMessageSend);
    initializeWebSocket();
  }

  Future initializeWebSocket() async {
    final uri = Uri.parse("ws://192.168.11.227:8888/chat");
    websocket = WebSocketChannel.connect(uri);
    await websocket.ready;
    subscription = websocket.stream.listen((message) {
      final Map<String, dynamic> msg = jsonDecode(message);
      add(CustomerServiceMessageReceived(message: msg));
    });
  }

  late final WebSocketChannel websocket;
  late final StreamSubscription subscription;

  @override
  Future<void> close() async {
    super.close();
    websocket.sink.close(websocket_status.normalClosure, "Connection closed.");
    subscription.cancel();
  }

  Future _onMessageReceived(
    CustomerServiceMessageReceived event,
    Emitter<CustomerServiceState> emit,
  ) async {
    var messages = List<Map<String, dynamic>>.from(state.messages);
    messages.add(event.message);

    emit(state.copyWith(messages: messages));
  }

  Future _onMessageSend(CustomerServiceMessageSend event, Emitter<CustomerServiceState> emit) async {
    final message = {
      "message": event.message,
      "direction": "from",
      "date": DateTime.now().toLocal().toIso8601String(),
    };
    var messages = List<Map<String, dynamic>>.from(state.messages);
    messages.add(message);
    websocket.sink.add(jsonEncode(message));
    emit(state.copyWith(messages: messages));
  }
}
