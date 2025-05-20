import 'package:equatable/equatable.dart';

import '../../../data/models/cardModels/card_model.dart';

enum CardStatus { idle, loading, error }

class CardState extends Equatable {
  final CardStatus status;
  final List<CardModel> cards;
  final bool isSuccess;

  const CardState({
    required this.cards,
    required this.status,
    required this.isSuccess,
  });

  factory CardState.initial() {
    return CardState(
      cards: [],
      status: CardStatus.loading,
      isSuccess: false,
    );
  }

  CardState copyWith({List<CardModel>? card, CardStatus? status, bool? isSuccess}) {
    return CardState(
      cards: card ?? cards,
      status: status ?? this.status,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }


  @override
  List<Object> get props => [
        cards,
        status,
        isSuccess,
      ];
}
