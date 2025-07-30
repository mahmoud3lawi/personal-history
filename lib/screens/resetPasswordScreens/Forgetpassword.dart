import 'package:flutter/material.dart';
import 'package:personal_history/const.dart';
import 'package:personal_history/screens/resetPasswordScreens/email.dart';
import 'package:personal_history/screens/resetPasswordScreens/phone.dart';
import 'package:personal_history/widgets/CustomButton.dart';
import 'package:personal_history/widgets/selection.dart';

class Forget extends StatefulWidget {
  const Forget({super.key});

  @override
  State<Forget> createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  bool isEmailSelected = false;
  bool isPhoneSelected = false;

  void selectEmail() {
    setState(() {
      isEmailSelected = true;
      isPhoneSelected = false;
    });
  }

  void selectPhone() {
    setState(() {
      isPhoneSelected = true;
      isEmailSelected = false;
    });
  }

  void navigateToResetScreen() {
    if (isEmailSelected || isPhoneSelected) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              isEmailSelected ? const EmailVerify() : const PhoneVerify(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("يرجى اختيار البريد الإلكتروني أو الهاتف"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: bgcolor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const Text(
                  'نسيت كلمة المرور',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 13),
                const Text(
                  'يرجى اختيار الطريقة لإرسال رابط إعادة تعيين كلمة المرور',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                SelectionOption(
                  isSelected: isEmailSelected,
                  icon: Icons.email_rounded,
                  text: 'إعادة التعيين عبر البريد الإلكتروني',
                  onTap: selectEmail,
                ),
                const SizedBox(height: 32),
                SelectionOption(
                  isSelected: isPhoneSelected,
                  icon: Icons.phone,
                  text: 'إعادة التعيين عبر الهاتف',
                  onTap: selectPhone,
                ),
                const SizedBox(height: 50),
                CustomButton(
                   width: double.infinity,
                  text: "اكمل",
                  ontap: navigateToResetScreen,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
