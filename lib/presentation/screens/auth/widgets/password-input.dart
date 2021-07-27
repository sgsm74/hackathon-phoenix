import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final TextEditingController userPasswordController;
  const PasswordInput({Key? key, required this.userPasswordController})
      : super(key: key);

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.userPasswordController,
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
    );
  }
}
