import 'package:flutter/material.dart';
import 'package:personal_history/const.dart';
import 'package:personal_history/screens/patientScreens/adwity/addAdwity.dart';
import 'package:personal_history/widgets/CustomButton.dart';
import 'package:table_calendar/table_calendar.dart';

class Adwity extends StatefulWidget {
  const Adwity({super.key});

  @override
  State<Adwity> createState() => _AdwityState();
}

class _AdwityState extends State<Adwity> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    // أبعاد الشاشة
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
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.grey),
            onPressed: () {},
          ),
        ],
        title: const Center(child: Text('ادويتي')),
      ),
      backgroundColor: bgcolor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 20),
          TableCalendar(
            locale: 'ar_EG',
            firstDay: DateTime.now(),
            lastDay: DateTime.utc(2050, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            calendarStyle: const CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            startingDayOfWeek: StartingDayOfWeek.saturday,
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            calendarFormat: CalendarFormat.week,
          ),
          const SizedBox(height: 20),
          Center(
            child: Container(
              width: width * 0.95,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/Time management.png',
                    height: height * 0.15,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 12),
                  CustomButton(
                    text: 'اضافة دواء جديد',
                    width: width * 0.85,
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Addadwity(),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            'ادوية اليوم',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          // يمكنك استخدام ListView.builder بدلاً من تكرار الكود مرتين
          ...List.generate(2, (index) => buildMedicineCard(width, height)),
        ]),
      ),
    );
  }

  Widget buildMedicineCard(double width, double height) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Center(
        child: Container(
          width: width * 0.95,
          height: height * 0.16,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                width: width * 0.18,
                height: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(230, 239, 255, 1),
                ),
                child: const Center(
                  child: Text(
                    '  17\nالاحد',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'باراسيتامول',
                              style: TextStyle(fontSize: 16, color: txtcolor),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'للصداع',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(107, 112, 122, 1)),
                            ),
                            const SizedBox(height: 5),
                            const Row(
                              children: [
                                Icon(
                                  Icons.medication,
                                  color: Color.fromRGBO(107, 112, 122, 1),
                                ),
                                Text(
                                  '2 قرص',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromRGBO(107, 112, 122, 1)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Container(
                                  width: 18,
                                  height: 18,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: kPrimaryColor, width: 2)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text('تناولته',
                                    style: TextStyle(
                                        fontSize: 16, color: txtcolor)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/image 16.png', height: 70),
                          const SizedBox(
                            height: 10,
                          ),
                          const Icon(
                            Icons.arrow_back,
                            color: Color.fromRGBO(107, 112, 122, 1),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
