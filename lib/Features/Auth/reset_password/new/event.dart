sealed class ResetEmailEvent{}
final class ResetEmailLoad extends ResetEmailEvent{}

// sealed class ResetCodeEvent {}
final class ResetCodeLoad extends ResetEmailEvent{}

// sealed class ResetNewPasswordEvent{}
final class ResetNewPasswordLoad extends ResetEmailEvent{}