import 'package:flutter/material.dart';
import 'package:personal_history/const.dart';
import 'package:personal_history/screens/resetPasswordScreens/Forgetpassword.dart';
import 'package:personal_history/widgets/CustomButton.dart';
import 'package:personal_history/widgets/customPasswordField.dart';
import 'package:personal_history/widgets/customTextField.dart';
import '../../../patientScreens/homePatient.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 25),
                Image.asset("images/logo.png",
                    width: 50, height: 50, color: kPrimaryColor),
                const Text("صحتك",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor)),
                const SizedBox(height: 25),
                const Text("تسجيل الدخول",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                const SizedBox(height: 13),
                const Text("مرحبًا بعودتك! الرجاء تسجيل الدخول",
                    style: TextStyle(fontSize: 20, color: Colors.grey)),
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
                const SizedBox(height: 20),
                CustomPasswordField(
                  controller: passwordController,
                  focusNode: passwordFocusNode,
                  label: "كلمة السر",
                  validator: (value) => value!.length < 8
                      ? "كلمة السر يجب أن تكون أكثر من 7 أحرف"
                      : null,
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Forget(),
                          ),
                        );
                      },
                      child: const Text(
                        "هل نسيت كلمة السر ؟",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                CustomButton(
                  width: double.infinity,
                  text: "تسجيل الدخول",
                  ontap: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePatient()));
                    }
                  },
                ),
                const SizedBox(height: 30),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(
                        "images/Ellipse 2.png",
                      ),
                      height: 50,
                    ),
                    SizedBox(width: 20),
                    Image(
                      image: AssetImage("images/Ellipse 3.png"),
                      height: 50,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("ليس لديك حساب؟",
                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "سجل الآن",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 18,
                          decorationColor: kPrimaryColor,
                          decorationThickness: 2,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
