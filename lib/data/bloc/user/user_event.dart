abstract class UserDataEventAbstract {
  UserDataEventAbstract();
}

class FetchUserDataEvent extends UserDataEventAbstract {
  final int id;
  FetchUserDataEvent(this.id);
  @override
  String toString() => 'LoadUserDataEvent { id: $id }';
}
