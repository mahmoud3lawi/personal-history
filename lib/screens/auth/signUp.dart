import 'package:flutter/material.dart';
import 'package:personal_history/screens/auth/login.dart';
import 'package:personal_history/const.dart';
import 'package:personal_history/widgets/CustomButton.dart';
import 'package:personal_history/widgets/customPasswordField.dart';
import 'package:personal_history/widgets/customTextField.dart';
import '../patientScreens/homePatient.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    nameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();

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
                Image.asset("assets/images/logo.png",
                    width: 50, height: 50, color: kPrimaryColor),
                const Text("صحتك",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor)),
                const SizedBox(height: 25),
                const Text("أنشئ حسابك",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                const SizedBox(height: 13),
                const Text("مرحبًا بك في التطبيق، حيث تبدأ رحلتك!",
                    style: TextStyle(fontSize: 20, color: Colors.grey)),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: nameController,
                  focusNode: nameFocusNode,
                  label: "الاسم",
                  icon: Icons.account_circle_rounded,
                  validator: (value) =>
                      value!.isEmpty ? "الاسم لا يمكن أن يكون فارغًا" : null,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: emailController,
                  focusNode: emailFocusNode,
                  label: "البريد الإلكتروني",
                  icon: Icons.email_rounded,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "البريد الإلكتروني لا يمكن أن يكون فارغًا";
                    }
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
                const SizedBox(height: 20),
                CustomPasswordField(
                  controller: confirmPasswordController,
                  focusNode: confirmPasswordFocusNode,
                  label: "تأكيد كلمة السر",
                  validator: (value) => value != passwordController.text
                      ? "كلمة السر غير مطابقة"
                      : null,
                ),
                const SizedBox(height: 30),
                CustomButton(
                   width: double.infinity,
                  text: "إنشاء حساب",
                  ontap: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePatient()));
                    }
                  },
                ),
                const SizedBox(height: 30),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(
                        "assets/images/Ellipse 2.png",
                      ),
                      height: 50,
                    ),
                    SizedBox(width: 20),
                    Image(
                      image: AssetImage("assets/images/Ellipse 3.png"),
                      height: 50,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("هل لديك حساب بالفعل؟",
                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      },
                      child: const Text(
                        "تسجيل الدخول",
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
