import 'package:equatable/equatable.dart';
import '../../../data/models/cardModels/card_model.dart';

enum CardStatus { idle, loading, error }

class CardState extends Equatable {
  final CardStatus status;
  final List<CardCreateModel> cards;
  final CardCreateModel card;

  const CardState({
    required this.cards,
    required this.status,
    required this.card,
  });

  factory CardState.initial() {
    return CardState(
      cards: [],
      card: CardCreateModel(
        id: 0,
        cardNumber: '',
        expiryDate: DateTime.now(),
        securityCode: '',
      ),
      status: CardStatus.loading,
    );
  }

  CardState copyWith({
    List<CardCreateModel>? cards,
    CardStatus? status,
    CardCreateModel? cardModel,
  }) {
    return CardState(
      cards: cards ?? this.cards,
      card: cardModel ?? this.card,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [cards, status, card];
}
