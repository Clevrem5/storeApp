 
part of 'reset_bloc.dart';
sealed class ResetEmailEvent {}

final class SendEmailEvent extends ResetEmailEvent {
  final String email;

  SendEmailEvent({required this.email});
}

final class SendCodeEmailEvent extends ResetEmailEvent {
  final String code;

  SendCodeEmailEvent({
    required this.code,
  });
}

final class ResetPasswordEvent extends ResetEmailEvent {
  final String password;

  ResetPasswordEvent({
    required this.password,
  });
}


 
