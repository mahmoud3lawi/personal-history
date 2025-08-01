import 'package:flutter/material.dart';
import 'package:personal_history/const.dart';
import 'package:personal_history/screens/resetPasswordScreens/otp_email.dart';
import 'package:personal_history/widgets/CustomButton.dart';
import 'package:personal_history/widgets/customTextField.dart';

class EmailVerify extends StatefulWidget {
  const EmailVerify({super.key});

  @override
  State<EmailVerify> createState() => _EmailVerifyState();
}

class _EmailVerifyState extends State<EmailVerify> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FocusNode emailFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: bgcolor,
        elevation: 0,
      ),
      backgroundColor: bgcolor,
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const Text(
                  "تابع عبر البريد الإلكتروني",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 13),
                const Text(
                  "أدخل بريدك الإلكتروني، سنرسل لك رمز التحقق عبر\nالبريد الإلكتروني",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: emailController,
                  focusNode: emailFocusNode,
                  label: "البريد الإلكتروني",
                  icon: Icons.email_rounded,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return "البريد الإلكتروني لا يمكن أن يكون فارغًا";
                    if (!RegExp(
                            r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                        .hasMatch(value)) {
                      return "يرجى إدخال بريد إلكتروني صالح";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 50),
                CustomButton(
                   width: double.infinity,
                  text: "ارسال",
                  ontap: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpEmail(),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
