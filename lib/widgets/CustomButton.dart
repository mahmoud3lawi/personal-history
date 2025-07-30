import 'package:flutter/material.dart';
import 'package:personal_history/const.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.text, this.ontap, required this.width});
  String text;
  VoidCallback? ontap;
  double width; // Changed from int to double

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      width: width, // Now accepts a double value
      height: 52,
      child: MaterialButton(
        onPressed: ontap,
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}