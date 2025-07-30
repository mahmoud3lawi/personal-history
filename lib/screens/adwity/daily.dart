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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: _buildAppBar(),
        backgroundColor: bgcolor,
        body: TabBarView(
          children: [
            _buildDailyTab(),
            _buildWeeklyTab(),
            _buildMonthlyTab(),
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
      title: Center(
        child: Text(
          'اختر نوع الجدول الزمني',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color.fromRGBO(31, 51, 89, 1),
          ),
        ),
      ),
      bottom: TabBar(
        indicatorColor: kPrimaryColor,
        labelColor: Color.fromRGBO(31, 51, 89, 1),
        unselectedLabelColor: Color.fromRGBO(142, 150, 162, 1),
        tabs: [
          Tab(child: _buildTabText('يوميا')),
          Tab(child: _buildTabText('اسبوعيا')),
          Tab(child: _buildTabText('شهريا')),
        ],
      ),
    );
  }

  Widget _buildTabText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildDailyTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDropdown(
              'التكرار', _selectedRepeat, ['كل يوم', 'كل يومين', 'كل أسبوع'],
              (newValue) {
            setState(() => _selectedRepeat = newValue);
          }),
          SizedBox(height: 16),
          _buildDropdown(
              'وقت التنبيه', _selectedTime, ['8 صباحًا', '12 ظهرًا', '8 مساء'],
              (newValue) {
            setState(() => _selectedTime = newValue);
          }),
          SizedBox(height: 16),
          _buildDateField('التاريخ', _dailyStartDate!, (pickedDate) {
            setState(
                () => _dailyStartDate = pickedDate.toString().split(' ')[0]);
          }),
          SizedBox(height: 16),
          _buildDateField(
              'تاريخ النهاية', _dailyEndDate ?? 'أدخل تاريخ النهاية',
              (pickedDate) {
            _validateEndDate(pickedDate, _dailyStartDate!, (date) {
              setState(() => _dailyEndDate = date);
            });
          }),
          SizedBox(height: 32),
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
      ),
    );
  }

  Widget _buildWeeklyTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('الايام',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          _buildDaysRow(),
          SizedBox(height: 16),
          _buildDropdown(
              'وقت التنبيه', _selectedTime, ['8 صباحًا', '12 ظهرًا', '8 مساء'],
              (newValue) {
            setState(() => _selectedTime = newValue);
          }),
          SizedBox(height: 16),
          _buildDateField('التاريخ', _weeklyStartDate!, (pickedDate) {
            setState(
                () => _weeklyStartDate = pickedDate.toString().split(' ')[0]);
          }),
          SizedBox(height: 16),
          _buildDateField(
              'تاريخ النهاية', _weeklyEndDate ?? 'أدخل تاريخ النهاية',
              (pickedDate) {
            _validateEndDate(pickedDate, _weeklyStartDate!, (date) {
              setState(() => _weeklyEndDate = date);
            });
          }),
          SizedBox(height: 32),
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
      ),
    );
  }

  Widget _buildMonthlyTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDateField('حدد اليوم', 'حدد اليوم', (pickedDate) {
            setState(
                () => _monthlyStartDate = pickedDate.toString().split(' ')[0]);
          }),
          SizedBox(height: 16),
          _buildDropdown(
              'وقت التنبيه', _selectedTime, ['8 صباحًا', '12 ظهرًا', '8 مساء'],
              (newValue) {
            setState(() => _selectedTime = newValue);
          }),
          SizedBox(height: 16),
          _buildDateField('التاريخ', _monthlyStartDate!, (pickedDate) {
            setState(
                () => _monthlyStartDate = pickedDate.toString().split(' ')[0]);
          }),
          SizedBox(height: 16),
          _buildDateField(
              'تاريخ النهاية', _monthlyEndDate ?? 'أدخل تاريخ النهاية',
              (pickedDate) {
            _validateEndDate(pickedDate, _monthlyStartDate!, (date) {
              setState(() => _monthlyEndDate = date);
            });
          }),
          SizedBox(height: 32),
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
      ),
    );
  }

  Widget _buildDropdown(String label, String? value, List<String> items,
      ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        TextFormField(
          readOnly: true,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: Icon(Icons.calendar_today),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildDayButton('سبت'),
        _buildDayButton('أحد'),
        _buildDayButton('اثنين'),
        _buildDayButton('ثلاثاء'),
        _buildDayButton('اربع'),
        _buildDayButton('خميس'),
        _buildDayButton('جمعة'),
      ],
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
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
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
                : Color.fromRGBO(142, 150, 162, 1),
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
        SnackBar(
          content: Text("تاريخ النهاية يجب أن يكون بعد تاريخ البداية"),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      updateEndDate(pickedDate.toString().split(' ')[0]); 
    }
  }
}
