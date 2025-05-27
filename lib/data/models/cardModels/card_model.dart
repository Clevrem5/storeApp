// class CardModel {
//   final int id;
//   final String cardNumber;
//
//   CardModel({
//     required this.id,
//     required this.cardNumber,
//   });
//
//   factory CardModel.fromJson(Map<String, dynamic> json) {
//     return CardModel(
//       id: json['id'],
//       cardNumber: json['cardNumber'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       "id": id,
//       "cardNumber": cardNumber,
//     };
//   }
//
//   CardModel copyWith({int? id ,String? cardnum}){
//     return CardModel(id: id??this.id, cardNumber: cardnum??cardNumber);
//   }
// }

class CardCreateModel {
 late final int id;
  final String cardNumber;
  final DateTime? expiryDate;
  final String? securityCode;

  CardCreateModel({
     required this.id,
    required this.cardNumber,
    this.expiryDate,
    this.securityCode,
  });

  factory CardCreateModel.fromJson(Map<String, dynamic> json) {
    return CardCreateModel(
      id: json['id'],
      cardNumber: json['cardNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "cardNumber": cardNumber,
      "expiryDate": expiryDate!.toIso8601String().split('T')[0], // "2025-05-21",
      "securityCode": securityCode,
    };
  }
}
