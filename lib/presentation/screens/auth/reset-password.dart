import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synergy/data/bloc/reset-password/ResetPassword_event.dart';
import 'package:synergy/data/bloc/reset-password/ResetPassword_state.dart';
import 'package:synergy/data/bloc/reset-password/reset-password_bloc.dart';
import 'package:synergy/presentation/screens/auth/widgets/email-input.dart';
import 'package:synergy/presentation/screens/auth/widgets/heading-title.dart';
import 'package:synergy/presentation/screens/auth/widgets/login-painter.dart';
import 'package:synergy/presentation/screens/auth/widgets/or-divider.dart';
import 'package:synergy/presentation/screens/auth/widgets/secondry-button.dart';
import 'package:synergy/presentation/widgets/snackbar.dart';
import 'package:synergy/utils/constants.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ResetPasswordBloc>(
      create: (context) => ResetPasswordBloc(),
      child: ResetPasswordView(),
    );
  }
}

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  _ResetPasswordViewState createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  bool obscureText = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController userEmailController = TextEditingController();

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
            HeadingTitle(title: "Reset Password"),
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
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              List<String> data = [
                                userEmailController.text,
                              ];
                              BlocProvider.of<ResetPasswordBloc>(context)
                                  .add(ResetPasswordEvent(data));
                            }
                          },
                          child: BlocConsumer<ResetPasswordBloc,
                              ResetPasswordState>(
                            listener: (context, state) {
                              if (state is SuccessResetPassword) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    mySnackBar(state.message.toString(),
                                        color: Colors.green));
                              } else if (state is FailResetPassword) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    mySnackBar(state.message.toString()));
                              }
                            },
                            builder: (context, state) {
                              if (state is InitialResetPassword) {
                                return Text(
                                  "Reset Password",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                );
                              } else if (state is LoadingResetPassword) {
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
                                  "Reset Password",
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
                        title: "Log in",
                        function: () {
                          Navigator.of(context).popAndPushNamed('/login');
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
