import 'package:flutter/material.dart';
import 'package:personal_history/screens/patientScreens/adwity/daily.dart';
import 'package:personal_history/const.dart';
import 'package:personal_history/widgets/customTextField.dart';

class Editadwity extends StatefulWidget {
  const Editadwity({super.key});

  @override
  State<Editadwity> createState() => _EditadwityState();
}

class _EditadwityState extends State<Editadwity> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgcolor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Center(
            child: Text(
          'تعديل بيانات الدواء',
          style: TextStyle(color: txtcolor),
        )),
      ),
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.03),
                    Center(
                      child: Image.asset(
                        'assets/images/image 16.png',
                        height: height * 0.15,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'اسم الدواء',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: txtcolor),
                    ),
                    const FormFieldWidget(hintText: 'من فضلك ادخل اسم الدواء'),
                    const Text(
                      'الغرض',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: txtcolor),
                    ),
                    const FormFieldWidget(
                        hintText: 'من فضلك ادخل الغرض من الدواء'),
                    // ignore: prefer_const_constructors
                    Row(
                      children: const [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'الجرعه',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: txtcolor),
                              ),
                              SizedBox(height: 5),
                              FormFieldWidget(hintText: 'عدد الجرعات'),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'مدة الاستخدام',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: txtcolor),
                              ),
                              SizedBox(height: 5),
                              FormFieldWidget(hintText: '10 أيام'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      'ملاحظات',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: txtcolor),
                    ),
                    const FormFieldWidget(
                        hintText: 'مثال يتم تناوله بعد الغداء'),
                    const Text(
                      'التوقيت',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: txtcolor),
                    ),
                    const FormFieldWidget(hintText: 'مثال: الساعة 9 صباحاً'),
                    SizedBox(height: height * 0.08), // بدل SizedBox ثابت
                  ],
                ),
              ),
            ),

            // ✅ Bottom buttons
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddMedicineScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "حفظ",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          // تنفيذ عملية الحذف هنا
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(color: kPrimaryColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "حذف الدواء",
                          style: TextStyle(color: kPrimaryColor, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
