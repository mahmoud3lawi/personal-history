// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // لاستيراد input formatters
import 'package:personal_history/const.dart';
import 'package:personal_history/screens/resetPasswordScreens/reset.dart';
import 'package:personal_history/widgets/CustomButton.dart';

class OtpPhone extends StatefulWidget {
  @override
  _OtpPhoneState createState() => _OtpPhoneState();
}

class _OtpPhoneState extends State<OtpPhone> {
  final List<TextEditingController> textControllers =
      List.generate(4, (index) => TextEditingController());
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    focusNodes = List.generate(4, (index) => FocusNode());
  }

  @override
  void dispose() {
    for (var node in focusNodes) {
      node.dispose();
    }
    for (var controller in textControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Widget _buildOTPBox(int index) {
    return SizedBox(
      width: 60, // عرض الحقل
      child: TextField(
        controller: textControllers[index],
        focusNode: focusNodes[index],
        keyboardType: TextInputType.number, // لوحة مفاتيح الأرقام
        textAlign: TextAlign.center, // النص في المنتصف
        textDirection: TextDirection.ltr, // اتجاه النص من اليسار لليمين
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly, // أرقام فقط
        ],
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black, // لون النص
        ),
        maxLength: 1, // عدد الحروف المسموح به
        decoration: const InputDecoration(
          counterText: "",
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor, width: 2),
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty) {
            if (index < 3) {
              FocusScope.of(context).requestFocus(focusNodes[index + 1]);
            } else {
              focusNodes[index].unfocus();
            }
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).requestFocus(focusNodes[index - 1]);
          }
        },
      ),
    );
  }

  void _verifyOTP() {
    String otp = textControllers.map((controller) => controller.text).join();
    if (otp.length == 4 && otp.isNotEmpty) {
      // Navigate to the Reset Password screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ResetPass()),
      );
    } else {
      // Show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى إدخال رمز التحقق المكون من 4 أرقام')),
      );
    }
  }

  void _resendOTP() {
    // Handle resend OTP logic here, like calling an API or sending a request.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تم إرسال رمز التحقق مرة أخرى')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              const Text(
                'رمز التحقق',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 8),
              const Text(
                'يرجى إدخال الرمز الذي أرسلناه للتو إلى رقم الهاتف +20-010-678-75828',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) => _buildOTPBox(index)),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "لم تستلم رمز التحقق؟",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  const SizedBox(width: 5),
                  InkWell(
                    onTap: _resendOTP,
                    child: const Text(
                      "إعادة إرسال الرمز",
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
              const SizedBox(height: 32),
              CustomButton(
                 width: double.infinity,
                text: "تأكيد",
                ontap: _verifyOTP,
              )
            ],
          ),
        ),
      ),
    );
  }
}
