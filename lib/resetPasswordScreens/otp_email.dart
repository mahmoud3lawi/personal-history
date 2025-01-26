import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // لاستيراد input formatters
import 'package:personal_history/const.dart';
import 'package:personal_history/resetPasswordScreens/reset.dart';
import 'package:personal_history/widgets/CustomButton.dart';

class OtpEmail extends StatefulWidget {
  @override
  _OtpEmailState createState() => _OtpEmailState();
}

class _OtpEmailState extends State<OtpEmail> {
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
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black, // لون النص
        ),
        maxLength: 1, // عدد الحروف المسموح به
        decoration: InputDecoration(
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
        MaterialPageRoute(builder: (context) => ResetPass()),
      );
    } else {
      // Show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('يرجى إدخال رمز التحقق المكون من 4 أرقام')),
      );
    }
  }

  void _resendOTP() {
    // Handle resend OTP logic here, like calling an API or sending a request.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('تم إرسال رمز التحقق مرة أخرى')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 80),
              Text(
                'رمز التحقق',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(height: 8),
              Text(
                'يرجى إدخال الرمز الذي أرسلناه للتو إلى example@gmail.com',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) => _buildOTPBox(index)),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: _resendOTP,
                child: Text(
                  "لم تستلم رمز التحقق؟",
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
              ),
              SizedBox(height: 32),
              CustomButton(
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
