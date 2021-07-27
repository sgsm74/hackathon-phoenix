import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synergy/data/bloc/register/register_bloc.dart';
import 'package:synergy/data/bloc/register/register_event.dart';
import 'package:synergy/data/bloc/register/register_state.dart';
import 'package:synergy/data/repositories/user-repository.dart';
import 'package:synergy/presentation/screens/auth/widgets/email-input.dart';
import 'package:synergy/presentation/screens/auth/widgets/heading-title.dart';
import 'package:synergy/presentation/screens/auth/widgets/name-input.dart';
import 'package:synergy/presentation/screens/auth/widgets/or-divider.dart';
import 'package:synergy/presentation/screens/auth/widgets/password-input.dart';
import 'package:synergy/presentation/screens/auth/widgets/secondry-button.dart';
import 'package:synergy/presentation/screens/auth/widgets/signup-painter.dart';
import 'package:synergy/presentation/widgets/snackbar.dart';
import 'package:synergy/utils/constants.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterBloc>(
      create: (context) => RegisterBloc(),
      child: SignUpView(),
    );
  }
}

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  final UserRepository userRepo = UserRepository();

  TextEditingController nameController = TextEditingController();
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
                painter: SignUpPainter(),
                child: Container(),
              ),
            ),
            HeadingTitle(title: "Create Account"),
            Positioned(
              bottom: 0,
              top: MediaQuery.of(context).size.height * 0.4,
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width - 50,
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      NameInput(nameController: nameController),
                      SizedBox(
                        height: 10,
                      ),
                      EmailInput(userEmailController: userEmailController),
                      SizedBox(
                        height: 10,
                      ),
                      PasswordInput(
                          userPasswordController: userPasswordController),
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
                                nameController.text,
                                userEmailController.text,
                                userPasswordController.text
                              ];
                              BlocProvider.of<RegisterBloc>(context)
                                  .add(RegisterUser(data));
                            }
                          },
                          child: BlocConsumer<RegisterBloc, RegisterUserState>(
                            listener: (context, state) {
                              if (state is SuccessUserRegister) {
                                Navigator.of(context).popAndPushNamed('/home');
                              } else if (state is FailUserRegister) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    mySnackBar(state.message.toString()));
                              }
                            },
                            builder: (context, state) {
                              if (state is InitialUserRegister) {
                                return Text(
                                  "Sign up",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                );
                              } else if (state is LoadingUserRegister) {
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
                                  "Sign up",
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
                        title: "Login",
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
