import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synergy/data/bloc/login/login_bloc.dart';
import 'package:synergy/data/bloc/login/login_event.dart';
import 'package:synergy/data/bloc/login/login_state.dart';
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
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  validateEmail(String email) {
    return EmailValidator.validate(email);
  }

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
                painter: MyPainter(),
                child: Container(),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.25,
                horizontal: 25,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
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
                      TextFormField(
                        controller: userEmail,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        enableInteractiveSelection: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            size: 20,
                          ),
                          prefixIconConstraints: BoxConstraints(),
                          hintText: "  Email",
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter email address";
                          } else if (!validateEmail(value)) {
                            return "Enter valid email address";
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: userPassword,
                        obscureText: obscureText,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock_outline_rounded,
                            size: 20,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                            child: Icon(
                              obscureText
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              size: 20,
                            ),
                          ),
                          prefixIconConstraints: BoxConstraints(),
                          hintText: "  Password",
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                          ),
                        ),
                        validator: (value) {
                          if (value!.length < 6 || value.isEmpty) {
                            return "password must be at least 6 characters";
                          }
                        },
                      ),
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
                                userEmail.text,
                                userPassword.text
                              ];
                              BlocProvider.of<LoginBloc>(context)
                                  .add(LoginUser(data));
                            }
                          },
                          child: BlocConsumer<LoginBloc, LoginUserState>(
                            listener: (context, state) {
                              // TODO: implement listener
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
                      SizedBox(
                        height: 30,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Divider(
                              color: Colors.grey,
                            ),
                            Container(
                              width: 25,
                              color: Colors.white,
                              child: Text(
                                "or",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.grey),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).popAndPushNamed('/signup');
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.transparent,
                            ),
                            elevation: MaterialStateProperty.resolveWith(
                                (states) => 0),
                          ),
                        ),
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

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_1 = Paint()
      ..color = Constants.primaryColor
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;
    Path path_1 = Path();
    path_1.moveTo(0, size.height * 0.20);
    path_1.cubicTo(size.width * 0.40, size.height * 0.30, size.width * 0.8,
        size.height * 0.01, size.width, size.height * 0.15);
    path_1.lineTo(size.width, size.height);
    path_1.lineTo(0, size.height);
    canvas.drawPath(path_1, paint_1);

    Paint paint_2 = Paint()
      ..color = Color(0xff0059D4)
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;
    Path path_2 = Path();
    path_2.moveTo(0, size.height * 0.4);
    path_2.cubicTo(size.width * 0.45, size.height * 0.35, size.width * 0.5,
        size.height * 0.55, size.width, size.height * 0.32);

    path_2.lineTo(size.width, size.height);
    path_2.lineTo(0, size.height);
    path_2.lineTo(0, size.height * 0.5);
    canvas.drawPath(path_2, paint_2);

    Paint paint_0 = Paint()
      ..color = Colors.white
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.52);

    path_0.cubicTo(size.width * 0.40, size.height * 0.45, size.width * 0.60,
        size.height * 0.65, size.width, size.height * 0.58);

    path_0.lineTo(size.width, size.height);
    path_0.lineTo(0, size.height);
    path_0.lineTo(0, size.height * 0.5);
    canvas.drawPath(path_0, paint_0);

    //canvas.drawShadow(path_2, Colors.grey, 0.1, false);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(MyPainter oldDelegate) => false;
}
