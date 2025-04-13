part of 'reset_bloc.dart';
sealed class ResetEvent {}

final class SendEmailEvent extends ResetEvent {
  final String email;

  SendEmailEvent({required this.email});
}

final class SendCodeEmail extends ResetEvent {
  final String email;
  final String code;

  SendCodeEmail({
    required this.email,
    required this.code,
  });
}

final class ResetPasswordEvent extends ResetEvent {
  final String password;
  final String email;
  final String code;

  ResetPasswordEvent({
    required this.email,
    required this.password,
    required this.code,
  });
}