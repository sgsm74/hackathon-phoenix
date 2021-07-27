import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:synergy/data/bloc/auth/auth_event.dart';
import 'package:synergy/data/bloc/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthUserEvent, AuthUserState> {
  AuthBloc() : super(InitialAuthUser());

  @override
  Stream<AuthUserState> mapEventToState(AuthUserEvent event) async* {
    if (event is AuthUser) {
      var box = await Hive.openBox('user');
      if (box.get('token') != null) {
        yield SuccessAuthUser();
      } else {
        yield FailAuthUser();
      }
    }
  }
}
