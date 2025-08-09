import 'package:flutter/material.dart';
import 'package:personal_history/const.dart';
import 'package:personal_history/widgets/CustomButton.dart';
import 'package:personal_history/widgets/customTextField.dart';

class EditMedical extends StatelessWidget {
  const EditMedical({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgcolor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: txtcolor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Center(
          child: Text(
            'تعديل الملف الطبي ',
            style: TextStyle(color: txtcolor),
          ),
        ),
      ),
      backgroundColor: bgcolor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage('assets/images/man.png'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: kPrimaryColor,
                    ),
                    child:
                        const Icon(Icons.edit, color: Colors.white, size: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            buildFieldLabel('تاريخ الميلاد'),
            const FormFieldWidget(hintText: 'يوم / شهر / سنه'),
            buildFieldLabel('الجنس'),
            buildDropdownField('اختر الجنس'),
            buildFieldLabel('فصيلة الدم'),
            buildDropdownField('اختر فصيلة دمك'),
            buildFieldLabel('الوزن'),
            const FormFieldWidget(hintText: 'ادخل وزنك بالكيلو جرام'),
            buildFieldLabel('الطول'),
            const FormFieldWidget(hintText: 'ادخل طولك بالسنتيمتر'),
            buildFieldLabelWithAdd('الحساسيه', context),
            const FormFieldWidget(hintText: 'ادخل نوع الحساسية'),
            buildFieldLabelWithAdd('الامراض المزمنة', context),
            const FormFieldWidget(
                hintText: 'من فضلك، ادخل الأمراض المزمنة مثل السكري'),
            buildFieldLabelWithAdd('الامراض الوراثية', context),
            const FormFieldWidget(hintText: 'من فضلك، أدخل الأمراض الوراثية'),
            const SizedBox(height: 30),
            Center(child: CustomButton(text: 'حفظ', width: screenWidth * 0.9)),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget buildFieldLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, bottom: 6),
      child: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: txtcolor,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget buildFieldLabelWithAdd(String label, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: txtcolor,
              fontSize: 16,
            ),
          ),
        ),
        Icon(Icons.add, size: screenWidth * 0.05, color: kPrimaryColor),
      ],
    );
  }

  Widget buildDropdownField(String hint) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: null,
          hint: Text(hint, style: const TextStyle(color: Colors.grey)),
          items: const [],
          onChanged: (value) {},
        ),
      ),
    );
  }
}
