import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget {
  final TextEditingController userEmailController;

  const EmailInput({Key? key, required this.userEmailController})
      : super(key: key);

  validateEmail(String email) {
    return EmailValidator.validate(email);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: userEmailController,
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
    );
  }
}
