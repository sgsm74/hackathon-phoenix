import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:synergy/data/bloc/activity/activity_event.dart';
import 'package:synergy/data/bloc/activity/activity_state.dart';
import 'package:synergy/data/repositories/activity-repository.dart';

class ActivityBloc extends Bloc<ActivityDataEvent, ActivityDataState> {
  ActivityBloc() : super(InitialActivityDataFetchState());

  ActivityRepository activityRepo = ActivityRepository();
  @override
  Stream<ActivityDataState> mapEventToState(
    ActivityDataEvent event,
  ) async* {
    try {
      if (event is ActivityDataFetchEvent) {
        yield LoadingActivityDataFetchState();
        var map = await activityRepo.parseActivityData(event.id);
        //await Future.delayed(Duration(seconds: 10000));
        yield SuccessActivityDataFetchState(map);
      }
    } catch (e) {
      yield state;
    }
  }
}
