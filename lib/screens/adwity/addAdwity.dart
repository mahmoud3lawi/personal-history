import 'package:flutter/material.dart';
import 'package:personal_history/screens/adwity/daily.dart';
import 'package:personal_history/const.dart';
import 'package:personal_history/widgets/customTextField.dart';

class Addadwity extends StatefulWidget {
  const Addadwity({super.key});

  @override
  State<Addadwity> createState() => _AddadwityState();
}

class _AddadwityState extends State<Addadwity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgcolor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('اضافة دواء جديد'),
      ),
      backgroundColor: bgcolor,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          'اسم الدواء',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    FormFieldWidget(
                      hintText: 'من فضلك ادخل اسم الدواء',
                    ),
                    Row(
                      children: [
                        Text(
                          'الغرض',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    FormFieldWidget(
                      hintText: 'من فضلك ادخل الغرض من الدواء',
                    ),
                    Row(
                      children: [
                        Text(
                          'الجرعه',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: FormFieldWidget(
                            hintText: 'عدد الجرعات',
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: FormFieldWidget(
                            hintText: 'عدد الجرامات',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'ملاحظات',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    FormFieldWidget(
                      hintText: 'مثال يتم تناوله بعد الغداء',
                    ),
                    const SizedBox(height: 100),
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
              child: Container(
                width: 345,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  AddMedicineScreen(),
                      ),
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
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
