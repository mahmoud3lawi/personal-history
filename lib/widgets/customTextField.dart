import 'package:flutter/material.dart';
import 'package:personal_history/const.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String label;
  final IconData icon;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.label,
    required this.icon,
    this.validator,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        floatingLabelStyle: const TextStyle(color: kPrimaryColor),
        labelText: label,
        labelStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        prefixIcon: Icon(
          icon,
          color: focusNode.hasFocus ? kPrimaryColor : Colors.black,
        ),
      ),
    );
  }
}


class FormFieldWidget extends StatelessWidget {
  final String hintText;

  const FormFieldWidget({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        const SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
            floatingLabelStyle: TextStyle(color: kPrimaryColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey),
            ),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: kPrimaryColor),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
