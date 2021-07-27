import 'package:flutter/material.dart';

class NameInput extends StatelessWidget {
  final TextEditingController nameController;
  const NameInput({Key? key, required this.nameController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameController,
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
    );
  }
}
