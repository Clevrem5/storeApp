import 'package:bloc/bloc.dart';

import '../../../data/repository/card/card_repository.dart';
import 'card_event.dart';
import 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  final CardRepository _repository;

  CardBloc({
    required CardRepository repo,
  })  : _repository = repo,
        super(CardState.initial()) {
    on<CardLoad>(_load);
  }

  Future<void> _load(CardLoad event, Emitter<CardState> emit) async {
    final card = await _repository.fetchCards();
    emit(
      state.copyWith(card: card, status: CardStatus.idle),
    );
  }
}
