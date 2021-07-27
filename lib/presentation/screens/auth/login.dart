import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synergy/data/bloc/login/login_bloc.dart';
import 'package:synergy/data/bloc/login/login_event.dart';
import 'package:synergy/data/bloc/login/login_state.dart';
import 'package:synergy/presentation/screens/auth/widgets/email-input.dart';
import 'package:synergy/presentation/screens/auth/widgets/heading-title.dart';
import 'package:synergy/presentation/screens/auth/widgets/login-painter.dart';
import 'package:synergy/presentation/screens/auth/widgets/or-divider.dart';
import 'package:synergy/presentation/screens/auth/widgets/password-input.dart';
import 'package:synergy/presentation/screens/auth/widgets/secondry-button.dart';
import 'package:synergy/presentation/widgets/snackbar.dart';
import 'package:synergy/utils/constants.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(),
      child: LoginView(),
    );
  }
}

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool obscureText = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: CustomPaint(
                painter: LoginPainter(),
                child: Container(),
              ),
            ),
            HeadingTitle(title: "Welcome Back"),
            Positioned(
              bottom: 0,
              top: MediaQuery.of(context).size.height * .5,
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width - 50,
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      EmailInput(userEmailController: userEmailController),
                      SizedBox(
                        height: 10,
                      ),
                      PasswordInput(
                          userPasswordController: userPasswordController),
                      SizedBox(
                        height: 50,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .popAndPushNamed('/reset-password');
                            },
                            child: Container(
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: Constants.primaryColor,
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              List<String> data = [
                                userEmailController.text,
                                userPasswordController.text
                              ];
                              BlocProvider.of<LoginBloc>(context)
                                  .add(LoginUser(data));
                            }
                          },
                          child: BlocConsumer<LoginBloc, LoginUserState>(
                            listener: (context, state) {
                              if (state is SuccessUserLogin) {
                                Navigator.of(context).popAndPushNamed('/home');
                              } else if (state is FailUserLogin) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    mySnackBar(state.message.toString()));
                              }
                            },
                            builder: (context, state) {
                              if (state is InitialUserLogin) {
                                return Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                );
                              } else if (state is LoadingUserLogin) {
                                return Container(
                                  width: 30,
                                  height: 30,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                );
                              } else {
                                return Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                );
                              }
                            },
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Constants.primaryColor,
                            ),
                            elevation: MaterialStateProperty.resolveWith(
                                (states) => 0),
                          ),
                        ),
                      ),
                      OrDivider(),
                      SecondryButton(
                        title: "Sign Up",
                        function: () {
                          Navigator.of(context).popAndPushNamed('/signup');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Constants.secondryColor,
    );
  }
}
