import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:synergy/data/bloc/reset-password/ResetPassword_event.dart';
import 'package:synergy/data/bloc/reset-password/ResetPassword_state.dart';
import 'package:synergy/data/repositories/user-repository.dart';
import 'package:synergy/data/services/getLocation.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc() : super(InitialResetPassword());

  final UserRepository repo = UserRepository();

  @override
  Stream<ResetPasswordState> mapEventToState(
      ResetPasswordEventAbstract event) async* {
    if (event is ResetPasswordEvent) {
      yield LoadingResetPassword();

      Response response = await repo.userResetPassword([
        event.data[0],
      ]);
      Map<String, dynamic> map = json.decode(response.body);

      //print(event.data);
      //await Future.delayed(Duration(seconds: 2));
      if (response.statusCode == 200) {
        yield SuccessResetPassword();
      } else if (response.statusCode != 200) {
        yield FailResetPassword(map["message"]);
      }
    }
  }
}
