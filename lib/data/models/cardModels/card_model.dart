class CardModel {
  final int id;
  final String cardNumber;

  CardModel({
    required this.id,
    required this.cardNumber,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      id: json['id'],
      cardNumber: json['cardNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "cardNumber": cardNumber,
    };
  }

  CardModel copyWith({int? id ,String? cardnum}){
    return CardModel(id: id??this.id, cardNumber: cardnum??cardNumber);
  }
}
