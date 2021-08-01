abstract class ActivityDataState {
  ActivityDataState();
}

class InitialActivityDataFetchState extends ActivityDataState {
  InitialActivityDataFetchState();
}

class LoadingActivityDataFetchState extends ActivityDataState {
  LoadingActivityDataFetchState();
}

class SuccessActivityDataFetchState extends ActivityDataState {
  var data;
  SuccessActivityDataFetchState(this.data);
}

class FailedActivityDataFetchState extends ActivityDataState {
  FailedActivityDataFetchState();
}
