abstract class RegisterUserState {
  const RegisterUserState();
}

class InitialUserRegister extends RegisterUserState {
  const InitialUserRegister();
}

class LoadingUserRegister extends RegisterUserState {
  const LoadingUserRegister();
}

class SuccessUserRegister extends RegisterUserState {
  const SuccessUserRegister();
}

class FailUserRegister extends RegisterUserState {
  final String message;
  const FailUserRegister(this.message);
}
