import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool obscureText = true;
  final _formKey = GlobalKey<FormState>();
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
                vertical: MediaQuery.of(context).size.height * 0.27,
                horizontal: 25,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Reset Password",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
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
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Processing Data'),
                                ),
                              );
                            }
                          },
                          child: Text(
                            "Send reset password link",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Color(0xff006BFF),
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
                            Navigator.of(context).pushNamed('/login');
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
      backgroundColor: Color(0xff0059D4),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_1 = Paint()
      ..color = Color(0xff006BFF)
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
