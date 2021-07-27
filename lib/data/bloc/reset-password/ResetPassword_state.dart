abstract class ResetPasswordState {
  const ResetPasswordState();
}

class InitialResetPassword extends ResetPasswordState {
  const InitialResetPassword();
}

class LoadingResetPassword extends ResetPasswordState {
  const LoadingResetPassword();
}

class SuccessResetPassword extends ResetPasswordState {
  final String message = 'Email sent, check your inbox or spam';
  const SuccessResetPassword();
}

class FailResetPassword extends ResetPasswordState {
  final String message;
  const FailResetPassword(this.message);
}
