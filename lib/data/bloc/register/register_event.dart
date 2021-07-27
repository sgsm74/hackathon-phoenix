abstract class RegisterUserEvent {
  const RegisterUserEvent();
}

class RegisterUser extends RegisterUserEvent {
  final List data;
  const RegisterUser(this.data);

  @override
  String toString() => 'RegisterUser { data: $data }';
}
