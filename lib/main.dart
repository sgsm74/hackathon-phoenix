import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:synergy/data/bloc/auth/auth_bloc.dart';
import 'package:synergy/data/bloc/auth/auth_event.dart';
import 'package:synergy/data/bloc/user/user_bloc.dart';
import 'package:synergy/presentation/router/app-router.dart';

void main() async {
  await Hive.initFlutter();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  // This wiget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => AuthBloc()..add(AuthUser()),
        ),
        BlocProvider<UserDataBloc>(
          create: (BuildContext context) => UserDataBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Synergy',
        theme: ThemeData(
          accentColor: Colors.white10,
          textTheme: TextTheme(
            bodyText2: TextStyle(fontFamily: 'Poppins'),
          ),
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Color(0xfff4f7fc),
        ),
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    );
  }
}
