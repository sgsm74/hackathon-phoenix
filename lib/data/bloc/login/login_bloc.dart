import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:synergy/data/bloc/login/login_event.dart';
import 'package:synergy/data/bloc/login/login_state.dart';
import 'package:synergy/data/repositories/user-repository.dart';

class LoginBloc extends Bloc<LoginUserEvent, LoginUserState> {
  LoginBloc() : super(InitialUserLogin());

  final UserRepository repo = UserRepository();

  @override
  Stream<LoginUserState> mapEventToState(LoginUserEvent event) async* {
    if (event is LoginUser) {
      yield LoadingUserLogin();
      Response response = await repo.userLogin([
        event.data[0],
        event.data[1],
      ]);
      Map<String, dynamic> map = json.decode(response.body);
      //await Future.delayed(Duration(seconds: 2));
      if (response.statusCode == 200) {
        yield SuccessUserLogin();
      } else if (response.statusCode != 200) {
        yield FailUserLogin(map["message"]);
      }
    }
  }
}
