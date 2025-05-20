import 'package:store_app/data/models/cardModels/card_model.dart';

import '../../client.dart';

class CardRepository {
  final ApiClient client;

  CardRepository({required this.client});


  Future<List<CardModel>> fetchCards() async {
    final rawCard = await client.fetchCards();
   final  cards = rawCard.map((e) => CardModel.fromJson(e)).toList();
    return cards;
  }
  Future<bool> fetchCreateCard(String cardNumber, DateTime expiryDate, String securityCode) async {
    final result = await client.fetchCreateCard(cardNumber, expiryDate, securityCode);
    if (result) {
      return true;
    } else {
      return false;
    }
  }

}
