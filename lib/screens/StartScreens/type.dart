import 'package:flutter/material.dart';
import 'package:personal_history/const.dart';
import 'package:personal_history/widgets/CustomButton.dart';

import '../auth/signUp.dart';

class UserType extends StatefulWidget {
  const UserType({super.key});

  @override
  State<UserType> createState() => _UserTypeState();
}

class _UserTypeState extends State<UserType> {
  String selectedType = ''; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
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
                        height: 102,
                        width: 358,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "دكتور",
                              style: TextStyle(fontSize: 32),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Image.asset("assets/images/doc.png"),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedType = 'مريض';
                        });
                      },
                      child: Container(
                        height: 102,
                        width: 358,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: selectedType == "مريض" ? 3 : 1,
                            color: selectedType == "مريض"
                                ? kPrimaryColor
                                : Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            const Text("مريض", style: TextStyle(fontSize: 32)),
                            const SizedBox(
                              width: 30,
                            ),
                            Image.asset("assets/images/pat.png"),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedType = 'معمل تحليل ';
                        });
                      },
                      child: Container(
                        height: 102,
                        width: 358,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: selectedType == "معمل تحليل " ? 3 : 1,
                            color: selectedType == "معمل تحليل "
                                ? kPrimaryColor
                                : Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "معمل تحليل ",
                              style: TextStyle(fontSize: 32),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Image.asset("assets/images/scien.png"),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedType = 'اشعة';
                        });
                      },
                      child: Container(
                        height: 102,
                        width: 358,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: selectedType == "اشعة" ? 3 : 1,
                            color: selectedType == "اشعة"
                                ? kPrimaryColor
                                : Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "اشعة",
                              style: TextStyle(fontSize: 32),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Image.asset("assets/images/scan.png"),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedType = 'صيدلية ';
                        });
                      },
                      child: Container(
                        height: 102,
                        width: 358,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: selectedType == "صيدلية " ? 3 : 1,
                            color: selectedType == "صيدلية "
                                ? kPrimaryColor
                                : Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "صيدلية ",
                              style: TextStyle(fontSize: 32),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Image.asset("assets/images/phar.png"),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: const Color.fromRGBO(255, 255, 255, 1),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomButton(
                width: double.infinity,
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
            ),
          ),
        ],
      ),
    );
  }
}
