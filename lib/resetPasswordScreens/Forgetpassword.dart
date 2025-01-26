import 'package:flutter/material.dart';
import 'package:personal_history/const.dart';
import 'package:personal_history/resetPasswordScreens/email.dart';
import 'package:personal_history/resetPasswordScreens/phone.dart';
import 'package:personal_history/widgets/CustomButton.dart';

class Forget extends StatefulWidget {
  const Forget({super.key});

  @override
  State<Forget> createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  bool isEmailSelected = false;
  bool isPhoneSelected = false;

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
              crossAxisAlignment: CrossAxisAlignment.center, // لضبط محاذاة النصوص
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
                  textAlign: TextAlign.center, // محاذاة النص إلى المنتصف
                ),
                const SizedBox(height: 32),
                // خيار البريد الإلكتروني
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isEmailSelected = true;
                      isPhoneSelected =
                          false; // إلغاء تحديد الهاتف إذا تم اختيار البريد الإلكتروني
                    });
                  },
                  child: Container(
                    height: 64,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isEmailSelected ? kPrimaryColor : Colors.black,
                        width: 1.5,
                      ),
                      boxShadow: isEmailSelected
                          ? [
                              BoxShadow(
                                color: kPrimaryColor.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ]
                          : null,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.email_rounded,
                          color: isEmailSelected ? kPrimaryColor : Colors.black,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'إعادة التعيين عبر البريد الإلكتروني',
                          style: TextStyle(
                            fontSize: 16,
                            color: isEmailSelected
                                ? kPrimaryColor
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                // خيار الهاتف
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isPhoneSelected = true;
                      isEmailSelected =
                          false; // إلغاء تحديد البريد الإلكتروني إذا تم اختيار الهاتف
                    });
                  },
                  child: Container(
                    height: 64,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isPhoneSelected ? kPrimaryColor : Colors.black,
                        width: 1.5,
                      ),
                      boxShadow: isPhoneSelected
                          ? [
                              BoxShadow(
                                color: kPrimaryColor.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ]
                          : null,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: isPhoneSelected ? kPrimaryColor : Colors.black,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'إعادة التعيين عبر الهاتف',
                          style: TextStyle(
                            fontSize: 16,
                            color: isPhoneSelected
                                ? kPrimaryColor
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                // زر الإكمال
                CustomButton(
                  text: "اكمل",
                  ontap: () {
                    if (isEmailSelected || isPhoneSelected) {
                      if (isEmailSelected) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EmailVerify(),
                          ),
                        );
                      } else if (isPhoneSelected) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PhoneVerify(),
                          ),
                        );
                      }
                    } else {
                      // إظهار رسالة تنبيه للمستخدم إذا لم يحدد خيارًا
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text("يرجى اختيار البريد الإلكتروني أو الهاتف"),
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
