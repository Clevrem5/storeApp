import 'package:store_app/data/models/cardModels/card_model.dart';

abstract class CardEvent{}


final class CardLoad extends CardEvent{}

final class CreateCard extends CardEvent {
  final CardCreateModel card;

  CreateCard({
    required this.card,

  });
}