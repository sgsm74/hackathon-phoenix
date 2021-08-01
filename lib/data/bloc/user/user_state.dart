abstract class UserDataStateAbstract {
  UserDataStateAbstract();
}

class InitialUserDataFetch extends UserDataStateAbstract {
  InitialUserDataFetch();
}

class LoadingUserDataFetch extends UserDataStateAbstract {
  LoadingUserDataFetch();
}

class SuccessUserDataFetch extends UserDataStateAbstract {
  var data;
  SuccessUserDataFetch(this.data);
}

class FailureUserDataFetch extends UserDataStateAbstract {
  FailureUserDataFetch();
}
