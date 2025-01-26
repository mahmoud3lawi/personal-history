import 'package:flutter/material.dart';
import 'package:personal_history/const.dart';
import 'package:personal_history/StartScreens/SignUp.dart';
import 'package:personal_history/widgets/CustomButton.dart';

class UserType extends StatefulWidget {
  const UserType({super.key});

  @override
  State<UserType> createState() => _UserTypeState();
}

class _UserTypeState extends State<UserType> {
  String selectedType = ''; // القيمة الافتراضية

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                "يرجى الاختيار",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const Text(
                "لضمان تجربة أفضل، أخبرنا بنوع حسابك",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedType = 'دكتور';
                  });
                },
                child: Container(
                  height: 189,
                  width: 344,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: selectedType == "دكتور" ? 3 : 1,
                      color: selectedType == "دكتور"
                          ? kPrimaryColor
                          : Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      const Text(
                        "دكتور",
                        style: TextStyle(fontSize: 32),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Image.asset("images/doc.png"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedType = 'مريض';
                  });
                },
                child: Container(
                  height: 189,
                  width: 344,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: selectedType == "مريض" ? 3 : 1,
                      color:
                          selectedType == "مريض" ? kPrimaryColor : Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const Text("مريض", style: TextStyle(fontSize: 32)),
                      const SizedBox(
                        width: 30,
                      ),
                      Image.asset("images/pat.png"),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              CustomButton(
                text: "التالي",
                ontap: () {
                  if (selectedType.isEmpty) {
                    // عرض رسالة خطأ إذا لم يتم اختيار نوع
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('يرجى اختيار نوع الحساب قبل المتابعة'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    // الانتقال إلى الشاشة التالية
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Signup(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
