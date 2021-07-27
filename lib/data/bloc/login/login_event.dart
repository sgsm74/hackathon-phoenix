abstract class LoginUserEvent {
  const LoginUserEvent();
}

class LoginUser extends LoginUserEvent {
  final List data;
  const LoginUser(this.data);

  @override
  String toString() => 'LoginUser { data: $data }';
}
