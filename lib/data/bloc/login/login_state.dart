abstract class LoginUserState {
  const LoginUserState();
}

class InitialUserLogin extends LoginUserState {
  const InitialUserLogin();
}

class LoadingUserLogin extends LoginUserState {
  const LoadingUserLogin();
}

class SuccessUserLogin extends LoginUserState {
  const SuccessUserLogin();
}

class FailUserLogin extends LoginUserState {
  final String message;
  const FailUserLogin(this.message);
}
