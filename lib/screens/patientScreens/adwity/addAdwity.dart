// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:personal_history/const.dart';
import 'package:personal_history/screens/patientScreens/adwity/editAdwity.dart';
import 'package:personal_history/widgets/customTextField.dart';

class Addadwity extends StatefulWidget {
  const Addadwity({super.key});

  @override
  State<Addadwity> createState() => _AddadwityState();
}

class _AddadwityState extends State<Addadwity> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
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
          'اضافة دواء جديد',
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
                    const SizedBox(height: 20),
                    Center(
                      child: Image.asset(
                        'assets/images/Time management.png',
                        height: height * 0.15,
                      ),
                    ),
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

                    const Text(
                      'الجرعه',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: txtcolor),
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        Expanded(
                          child: FormFieldWidget(hintText: 'عدد الجرعات'),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: FormFieldWidget(hintText: 'عدد الجرامات'),
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

                    SizedBox(height: height * 0.08), // بدلًا من 100 ثابت
                  ],
                ),
              ),
            ),

            // الزر السفلي
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: width * 0.9,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Editadwity()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "التالي",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
