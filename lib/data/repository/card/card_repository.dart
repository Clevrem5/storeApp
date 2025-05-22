import 'package:store_app/data/models/cardModels/card_model.dart';

import '../../client.dart';

class CardRepository {
  final ApiClient client;

  CardRepository({required this.client});


  Future<List<CardCreateModel>> fetchCards() async {
    final rawCard = await client.fetchCards();
   final  cards = rawCard.map((e) => CardCreateModel.fromJson(e)).toList();
    return cards;
  }
  Future<CardCreateModel> fetchCreateCard(CardCreateModel model) async {
    final result = await client.fetchCreateCard(model);
    return result;
  }

}
