import 'package:flutter/material.dart';
import 'package:personal_history/const.dart';
import 'package:personal_history/resetPasswordScreens/Forgetpassword.dart';
import 'package:personal_history/widgets/CustomButton.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool visiable = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // FocusNodes for email and password fields
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
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 25)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "images/logo.png",
                        width: 50,
                        height: 50,
                        color: kPrimaryColor,
                      ),
                      const Text(
                        "صحتك",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const Row(
                    children: [
                      Text(
                        "تسجيل الدخول إلى حسابك",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 13),
                  const Text(
                    "مرحبًا بعودتك هل أنت مستعد لإدارة صحتك بفعالية؟",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  // Email TextField
                  TextFormField(
                    controller: emailController,
                    focusNode: emailFocusNode,
                    decoration: InputDecoration(
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                      ),
                      floatingLabelStyle: const TextStyle(
                        color: kPrimaryColor,
                      ),
                      labelText: "البريد الإلكتروني",
                      labelStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      prefixIcon: Icon(
                        Icons.email_rounded,
                        color: emailFocusNode.hasFocus
                            ? kPrimaryColor
                            : Colors.black,
                      ),
                    ),
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
                  // Password TextField
                  TextFormField(
                    controller: passwordController,
                    obscureText: visiable,
                    focusNode: passwordFocusNode,
                    validator: (value) {
                      if (value!.length < 6) {
                        return "كلمة السر غير صحيحه";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor)),
                      floatingLabelStyle: const TextStyle(color: kPrimaryColor),
                      labelText: "كلمة السر ",
                      labelStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      prefixIcon: Icon(
                        Icons.lock_rounded,
                        color: passwordFocusNode.hasFocus
                            ? kPrimaryColor
                            : Colors.black,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            visiable = !visiable;
                          });
                        },
                        icon: Icon(
                          visiable ? Icons.visibility_off : Icons.visibility,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    onTap: () => setState(() {}),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
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
                  const SizedBox(height: 100),
                  CustomButton(text: "تسجيل الدخول"),
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
                      const Text(
                        "لا تمتلك حسابًا؟",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 107, 106, 106)),
                      ),
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
                            decoration: TextDecoration.underline,
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
      ),
    );
  }
}
