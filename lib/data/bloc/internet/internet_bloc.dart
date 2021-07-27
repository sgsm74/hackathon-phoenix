import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:synergy/data/bloc/internet/internet_event.dart';
import 'package:synergy/data/bloc/internet/internet_state.dart';

class InternetBloc extends Bloc<NetworkEvent, NetworkState> {
  late StreamSubscription connectivityStreamSubscription;
  InternetBloc() : super(ConnectionInitial());
  @override
  Stream<NetworkState> mapEventToState(NetworkEvent event) async* {
    try {
      if (event is ListenConnection) {
        /* var connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.mobile) {
          yield ConnectionSuccess();
        } else if (connectivityResult == ConnectivityResult.wifi) {
          yield ConnectionSuccess();
        } else {
          yield ConnectionFailure();
        } */

        connectivityStreamSubscription =
            Connectivity().onConnectivityChanged.listen((result) {
          add(ConnectionChanged(result == ConnectivityResult.none
              ? ConnectionFailure()
              : ConnectionSuccess()));
        });
      }
      if (event is ConnectionChanged) yield event.connection;
    } on Exception catch (_) {
      yield state;
    }
  }

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
