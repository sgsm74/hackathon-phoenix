abstract class ActivityDataEvent {
  ActivityDataEvent();
}

class ActivityDataFetchEvent extends ActivityDataEvent {
  final int id;
  ActivityDataFetchEvent(this.id);
}
