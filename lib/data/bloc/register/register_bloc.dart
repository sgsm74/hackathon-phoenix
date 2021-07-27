import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:synergy/data/bloc/register/register_event.dart';
import 'package:synergy/data/bloc/register/register_state.dart';
import 'package:synergy/data/repositories/user-repository.dart';
import 'package:synergy/data/services/getLocation.dart';

class RegisterBloc extends Bloc<RegisterUserEvent, RegisterUserState> {
  RegisterBloc() : super(InitialUserRegister());

  final UserRepository repo = UserRepository();

  @override
  Stream<RegisterUserState> mapEventToState(RegisterUserEvent event) async* {
    if (event is RegisterUser) {
      yield LoadingUserRegister();
      var position = await UserLocation.determinePosition();

      Response response = await repo.userRegister([
        event.data[0],
        event.data[1],
        event.data[2],
        position.latitude,
        position.longitude
      ]);
      Map<String, dynamic> map = json.decode(response.body);

      //print(event.data);
      //await Future.delayed(Duration(seconds: 2));
      if (response.statusCode == 200) {
        yield SuccessUserRegister();
      } else if (response.statusCode != 200) {
        yield FailUserRegister(map["message"]);
      }
    }
  }
}
