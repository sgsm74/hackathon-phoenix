abstract class ResetPasswordEventAbstract {
  const ResetPasswordEventAbstract();
}

class ResetPasswordEvent extends ResetPasswordEventAbstract {
  final List data;
  const ResetPasswordEvent(this.data);

  @override
  String toString() => 'ResetPassword { data: $data }';
}
