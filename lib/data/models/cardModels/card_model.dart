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

class CardCreateModel {
  final String cardNumber;
  final DateTime expiryDate;
  final String securityCode;

  CardCreateModel({
    required this.cardNumber,
    required this.expiryDate,
    required this.securityCode,
  });

  factory CardCreateModel.fromJosn(Map<String, dynamic> json) {
    return CardCreateModel(
      cardNumber: json['cardNumber'],
      expiryDate: DateTime.parse(json['expiryDate']),
      securityCode: json['securityCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "cardNumber": cardNumber,
      "expiryDate": expiryDate,
      "securityCode": securityCode,
    };
  }
}
