import 'package:flutter/material.dart';
import 'package:personal_history/const.dart';
import 'package:personal_history/screens/doctorScreens/addComment.dart';
import 'package:personal_history/widgets/CustomButton.dart';
import 'package:personal_history/widgets/customTextField.dart';

class AddCheckupScreen extends StatefulWidget {
  const AddCheckupScreen({super.key});

  @override
  State<AddCheckupScreen> createState() => _AddCheckupScreenState();
}

class _AddCheckupScreenState extends State<AddCheckupScreen> {
  String selectedStatus = "عادي";
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgcolor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.grey),
            onPressed: () {},
          ),
        ],
        title: const Center(
            child: Text(
          'اضافة كشف جديد',
          style: TextStyle(color: txtcolor),
        )),
      ),
      backgroundColor: bgcolor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            const Text(
              'اسم المريض ',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: txtcolor),
            ),
            const FormFieldWidget(hintText: 'من فضلك ادخل اسم المريض '),
            const Text(
              'رقم ID',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: txtcolor),
            ),
            const FormFieldWidget(hintText: 'من فضلك ادخل رقم ID '),
            const Text("الحالة",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: txtcolor)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatusButton("عادي"),
                _buildStatusButton("مؤجل"),
                _buildStatusButton("حرجة"),
                _buildStatusButton("متابعه"),
              ],
            ),
            const SizedBox(height: 16),
            const Text("ميعاد الكشف",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: txtcolor)),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: selectedDate == null
                        ? 'يوم / شهر / سنة'
                        : "${selectedDate!.day} / ${selectedDate!.month} / ${selectedDate!.year}",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    suffixIcon: const Icon(Icons.calendar_today),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            CustomButton(text: 'حفظ', width: double.infinity,ontap: () {
               Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddComment ()),
                    );
            },)
          ],
        ),
      ),
    );
  }

  Widget _buildStatusButton(String text) {
    final bool isSelected = selectedStatus == text;

    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedStatus = text;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? kPrimaryColor : bgcolor,
        foregroundColor: isSelected ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      locale: const Locale("ar", "EG"), // التقويم بالعربية
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
