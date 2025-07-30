import 'package:flutter/material.dart';
import 'package:personal_history/const.dart';
import 'package:personal_history/screens/resetPasswordScreens/congratulation.dart';
import 'package:personal_history/widgets/CustomButton.dart';
import 'package:personal_history/widgets/customPasswordField.dart';

class ResetPass extends StatefulWidget {
  const ResetPass({super.key});

  @override
  State<ResetPass> createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
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
                  "إعادة تعيين كلمة المرور",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 13),
                const Text(
                  "يجب أن تتكون كلمة المرور من 8 أحرف على الأقل وتتضمن مزيجًا من\nالأحرف والأرقام",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 20),

                // كلمة السر
                CustomPasswordField(
                  controller: passwordController,
                  focusNode: passwordFocusNode,
                  label: "كلمة السر",
                  validator: (value) => value!.length < 8
                      ? "كلمة السر يجب أن تكون أكثر من 7 أحرف"
                      : null,
                ),
                const SizedBox(height: 20),

                // تأكيد كلمة السر
                CustomPasswordField(
                  controller: confirmPasswordController,
                  focusNode: confirmPasswordFocusNode,
                  label: "تأكيد كلمة السر",
                  validator: (value) => value != passwordController.text
                      ? "كلمة السر غير مطابقة"
                      : null,
                ),
                const SizedBox(height: 50),

                CustomButton(
                   width: double.infinity,
                  text: "تغيير كلمة السر",
                  ontap: () {
                    if (formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("تم تغيير كلمة السر بنجاح")),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Congrats()),
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
