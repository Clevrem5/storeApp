 
part of 'reset_bloc.dart';
sealed class ResetEvent {}

final class SendEmailEvent extends ResetEvent {
  final String email;

  SendEmailEvent({required this.email});
}

final class SendCodeEmailEvent extends ResetEvent {
  final String code;

  SendCodeEmailEvent({
    required this.code,
  });
}

final class ResetPasswordEvent extends ResetEvent {
  final String password;

  ResetPasswordEvent({
    required this.password,
  });
}


 
