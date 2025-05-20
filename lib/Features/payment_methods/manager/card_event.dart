abstract class CardEvent{}


final class CardLoad extends CardEvent{}

final class CreateCard extends CardEvent {
  final String cardNumber;
  final DateTime expiryDate;
  final String securityCode;

  CreateCard({
    required this.cardNumber,
    required this.expiryDate,
    required this.securityCode,
  });
}