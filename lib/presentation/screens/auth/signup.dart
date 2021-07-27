import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synergy/data/bloc/register/register_bloc.dart';
import 'package:synergy/data/bloc/register/register_event.dart';
import 'package:synergy/data/bloc/register/register_state.dart';
import 'package:synergy/data/repositories/user-repository.dart';
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
    return BlocProvider(
        create: (context) => RegisterBloc(), child: SignUpView());
  }
}

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final UserRepository userRepo = UserRepository();

  TextEditingController userName = TextEditingController();
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
                painter: SignUpPainter(),
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
                  "Create Account",
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
              top: MediaQuery.of(context).size.height * .4,
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
                        controller: userName,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        enableInteractiveSelection: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person_outline_rounded,
                            size: 20,
                          ),
                          prefixIconConstraints: BoxConstraints(),
                          hintText: "  Name",
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 3) {
                            return "Name must be at least 3 characters";
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
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
                            return "Password must be at least 6 characters";
                          }
                        },
                      ),
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
                                userName.text,
                                userEmail.text,
                                userPassword.text
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
                          onPressed: () async {
                            Navigator.of(context).popAndPushNamed('/login');
                          },
                          child: Text(
                            "Log in",
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

class SignUpPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = Paint()
      ..color = Colors.white
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.45);
    path_0.cubicTo(size.width * 0.40, size.height * 0.35, size.width * 0.4,
        size.height * 0.55, size.width, size.height * 0.40);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(0, size.height);

    canvas.drawPath(path_0, paint_0);

    Paint paint_1 = Paint()
      ..color = Constants.primaryColor
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;
    Path path_1 = Path();
    path_1.moveTo(0, size.height * 0.15);
    path_1.cubicTo(size.width * 0.10, size.height * 0.20, size.width * 0.50,
        size.height * 0.10, size.width * 0.70, size.height * 0.15);

    path_1.cubicTo(size.width * 0.95, size.height * 0.20, size.width * 1.02,
        size.height * 0.30, size.width * 0.80, size.height * 0.35);

    path_1.cubicTo(size.width * 0.5, size.height * 0.42, size.width * 0.3,
        size.height * 0.30, 0, size.height * 0.40);

    canvas.drawPath(path_1, paint_1);
  }

  @override
  bool shouldRepaint(SignUpPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(SignUpPainter oldDelegate) => false;
}
