import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:synergy/data/bloc/user/user_event.dart';
import 'package:synergy/data/bloc/user/user_state.dart';
import 'package:synergy/data/repositories/user-repository.dart';

class UserDataBloc extends Bloc<UserDataEventAbstract, UserDataStateAbstract> {
  UserDataBloc() : super(InitialUserDataFetch());
  UserRepository userRepo = UserRepository();
  @override
  Stream<UserDataStateAbstract> mapEventToState(
    UserDataEventAbstract event,
  ) async* {
    if (event is FetchUserDataEvent) {
      yield LoadingUserDataFetch();
      var map = await userRepo.fetchUserData(event.id);
      //await Future.delayed(Duration(seconds: 10000));
      yield SuccessUserDataFetch(map);
    }
  }
}
