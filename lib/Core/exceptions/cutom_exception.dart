class CustomException implements Exception {
  final String errorMessage;
  final int statusCode;

  CustomException({
    required this.errorMessage,
    required this.statusCode,
  });
}