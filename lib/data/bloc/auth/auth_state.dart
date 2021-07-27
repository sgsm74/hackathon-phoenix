abstract class AuthUserState {
  const AuthUserState();
}

class InitialAuthUser extends AuthUserState {
  const InitialAuthUser();
}

class LoadingAuthUser extends AuthUserState {
  const LoadingAuthUser();
}

class SuccessAuthUser extends AuthUserState {
  const SuccessAuthUser();
}

class FailAuthUser extends AuthUserState {
  const FailAuthUser();
}
