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
        connectivityStreamSubscription =
            Connectivity().onConnectivityChanged.listen((result) {
          add(ConnectionChanged(result == ConnectivityResult.none
              ? ConnectionFailure()
              : ConnectionSuccess()));
        });
      }
      if (event is ConnectionChanged) yield event.connection;
    } catch (_) {
      yield state;
    }
  }

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
