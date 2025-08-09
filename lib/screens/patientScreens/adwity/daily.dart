// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:personal_history/const.dart';
import 'package:personal_history/widgets/CustomButton.dart';

class AddMedicineScreen extends StatefulWidget {
  @override
  _AddMedicineScreenState createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  String? _selectedRepeat = 'كل يوم';
  String? _selectedTime = '8 مساء';
  String? _dailyStartDate = DateTime.now().toString().split(' ')[0];
  String? _dailyEndDate;
  String? _weeklyStartDate = DateTime.now().toString().split(' ')[0];
  String? _weeklyEndDate;
  String? _monthlyStartDate = DateTime.now().toString().split(' ')[0];
  String? _monthlyEndDate;
  String? _selectedDay;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width >= 600;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: _buildAppBar(),
        backgroundColor: bgcolor,
        body: TabBarView(
          children: [
            _buildTabContent(_buildDailyTab(), isTablet),
            _buildTabContent(_buildWeeklyTab(), isTablet),
            _buildTabContent(_buildMonthlyTab(), isTablet),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: bgcolor,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: const Center(
        child: Text(
          'اختر نوع الجدول الزمني',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: txtcolor,
          ),
        ),
      ),
      bottom: TabBar(
        indicatorColor: kPrimaryColor,
        labelColor: kPrimaryColor,
        unselectedLabelColor: const Color.fromRGBO(142, 150, 162, 1),
        tabs: [
          Tab(child: _buildTabText('يوميا')),
          Tab(child: _buildTabText('اسبوعيا')),
          Tab(child: _buildTabText('شهريا')),
        ],
      ),
    );
  }

  Widget _buildTabContent(Widget child, bool isTablet) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: isTablet ? 600 : double.infinity,
          padding: const EdgeInsets.all(16.0),
          child: child,
        ),
      ),
    );
  }

  Widget _buildTabText(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildDailyTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDropdown(
            'التكرار', _selectedRepeat, ['كل يوم', 'كل يومين', 'كل أسبوع'],
            (newValue) {
          setState(() => _selectedRepeat = newValue);
        }),
        const SizedBox(height: 16),
        _buildDropdown(
            'وقت التنبيه', _selectedTime, ['8 صباحًا', '12 ظهرًا', '8 مساء'],
            (newValue) {
          setState(() => _selectedTime = newValue);
        }),
        const SizedBox(height: 16),
        _buildDateField('التاريخ', _dailyStartDate!, (pickedDate) {
          setState(() => _dailyStartDate = pickedDate.toString().split(' ')[0]);
        }),
        const SizedBox(height: 16),
        _buildDateField('تاريخ النهاية', _dailyEndDate ?? 'أدخل تاريخ النهاية',
            (pickedDate) {
          _validateEndDate(pickedDate, _dailyStartDate!, (date) {
            setState(() => _dailyEndDate = date);
          });
        }),
        const SizedBox(height: 40),
        CustomButton(
          width: double.infinity,
          text: 'اضافة',
          ontap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("تم اضافة دواء جديد"),
                backgroundColor: kPrimaryColor,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildWeeklyTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('الايام',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        _buildDaysRow(),
        const SizedBox(height: 16),
        _buildDropdown(
            'وقت التنبيه', _selectedTime, ['8 صباحًا', '12 ظهرًا', '8 مساء'],
            (newValue) {
          setState(() => _selectedTime = newValue);
        }),
        const SizedBox(height: 16),
        _buildDateField('التاريخ', _weeklyStartDate!, (pickedDate) {
          setState(
              () => _weeklyStartDate = pickedDate.toString().split(' ')[0]);
        }),
        const SizedBox(height: 16),
        _buildDateField('تاريخ النهاية', _weeklyEndDate ?? 'أدخل تاريخ النهاية',
            (pickedDate) {
          _validateEndDate(pickedDate, _weeklyStartDate!, (date) {
            setState(() => _weeklyEndDate = date);
          });
        }),
        const SizedBox(height: 40),
        CustomButton(
          width: double.infinity,
          text: 'اضافة',
          ontap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("تم اضافة دواء جديد"),
                backgroundColor: kPrimaryColor,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildMonthlyTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDateField('حدد اليوم', 'حدد اليوم', (pickedDate) {
          setState(
              () => _monthlyStartDate = pickedDate.toString().split(' ')[0]);
        }),
        const SizedBox(height: 16),
        _buildDropdown(
            'وقت التنبيه', _selectedTime, ['8 صباحًا', '12 ظهرًا', '8 مساء'],
            (newValue) {
          setState(() => _selectedTime = newValue);
        }),
        const SizedBox(height: 16),
        _buildDateField('التاريخ', _monthlyStartDate!, (pickedDate) {
          setState(
              () => _monthlyStartDate = pickedDate.toString().split(' ')[0]);
        }),
        const SizedBox(height: 16),
        _buildDateField(
            'تاريخ النهاية', _monthlyEndDate ?? 'أدخل تاريخ النهاية',
            (pickedDate) {
          _validateEndDate(pickedDate, _monthlyStartDate!, (date) {
            setState(() => _monthlyEndDate = date);
          });
        }),
        const SizedBox(height: 40),
        CustomButton(
          width: double.infinity,
          text: 'اضافة',
          ontap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("تم اضافة دواء جديد"),
                backgroundColor: kPrimaryColor,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildDropdown(String label, String? value, List<String> items,
      ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: txtcolor)),
        DropdownButtonFormField<String>(
          value: value,
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildDateField(
      String label, String hintText, ValueChanged<DateTime> onDatePicked) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: txtcolor)),
        TextFormField(
          readOnly: true,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: const Icon(Icons.calendar_today),
          ),
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(9999),
            );
            if (pickedDate != null) {
              onDatePicked(pickedDate);
            }
          },
        ),
      ],
    );
  }

  Widget _buildDaysRow() {
    final days = ['سبت', 'أحد', 'اثنين', 'ثلاثاء', 'اربع', 'خميس', 'جمعة'];
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: days.map(_buildDayButton).toList(),
    );
  }

  Widget _buildDayButton(String day) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedDay = day;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: _selectedDay == day ? kPrimaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        child: Text(
          day,
          style: TextStyle(
            color: _selectedDay == day
                ? Colors.white
                : const Color.fromRGBO(142, 150, 162, 1),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _validateEndDate(
      DateTime pickedDate, String startDate, Function(String) updateEndDate) {
    DateTime start = DateTime.parse(startDate);
    if (pickedDate.isBefore(start)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("تاريخ النهاية يجب أن يكون بعد تاريخ البداية"),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      updateEndDate(pickedDate.toString().split(' ')[0]);
    }
  }
}
