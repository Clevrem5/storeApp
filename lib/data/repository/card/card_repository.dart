import 'package:store_app/data/models/cardModels/card_model.dart';

import '../../client.dart';

class CardRepository {
  final ApiClient client;

  CardRepository({required this.client});

  List<CardModel> cards = [];

  Future<List<CardModel>> fetchCards() async {
    final rawCard = await client.fetchCards();
    cards = rawCard.map((e) => CardModel.fromJson(e)).toList();
    return cards;
  }
}
