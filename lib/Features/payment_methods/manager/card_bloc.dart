import 'package:bloc/bloc.dart';
import 'package:store_app/Core/exceptions/custom_exception.dart';

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
    on<CreateCard>(_createCard);
    on<CardDeleteEvent>(_delete);
  }

  Future<void> _load(CardLoad event, Emitter<CardState> emit) async {
    final card = await _repository.fetchCards();
    emit(
      state.copyWith(cards: card, status: CardStatus.idle),
    );
  }

  Future<void> _createCard(CreateCard event, Emitter<CardState> emit) async {
    final result = await _repository.fetchCreateCard(event.card);
    return emit(
      state.copyWith(
        status: CardStatus.idle,
        cardModel: result,
      ),
    );
  }

  Future<void> _delete(CardDeleteEvent event, Emitter<CardState> emit) async {
    final result = await _repository.fetchDeleteCard(event.id);
    if (result) {
      state.cards
          .where(
            (element) => element.id != event.id,
          )
          .toList();
      emit(state.copyWith(status: CardStatus.idle));
    }else{
      throw CustomException(message: "xato ketdi");
    }
  }
}
