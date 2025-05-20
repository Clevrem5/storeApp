import 'package:equatable/equatable.dart';

import '../../../data/models/cardModels/card_model.dart';

enum CardStatus { idle, loading, error }

class CardState extends Equatable {
  final CardStatus status;
  final List<CardModel> cards;

  const CardState({required this.cards, required this.status});

  factory CardState.initial() {
    return CardState(
      cards: [],
      status: CardStatus.loading,
    );
  }

  CardState copyWith({List<CardModel>? card, CardStatus? status}) {
    return CardState(
      cards: card ?? cards,
      status: status ?? this.status,
    );
  }


  @override
  List<Object> get props => [cards, status];
}
