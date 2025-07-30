import 'package:flutter/material.dart';
import 'package:personal_history/const.dart';

class CustomPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String label;
  final String? Function(String?)? validator;

  const CustomPasswordField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.label,
    this.validator,
  });

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      obscureText: isVisible,
      validator: widget.validator,
      decoration: InputDecoration(
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        floatingLabelStyle: const TextStyle(color: kPrimaryColor),
        labelText: widget.label,
        labelStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        prefixIcon: Icon(
          Icons.lock_rounded,
          color: widget.focusNode.hasFocus ? kPrimaryColor : Colors.black,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isVisible = !isVisible;
            });
          },
          icon: Icon(isVisible ? Icons.visibility_off : Icons.visibility),
        ),
      ),
    );
  }
}
