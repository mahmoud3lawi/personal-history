import 'package:flutter/material.dart';
import 'package:personal_history/const.dart';
import 'package:personal_history/screens/doctorScreens/addCheckup.dart';
import 'package:personal_history/widgets/CustomButton.dart';
import 'package:table_calendar/table_calendar.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmall = size.width < 400;

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
          'مواعيدي',
          style: TextStyle(color: txtcolor),
        )),
      ),
      backgroundColor: bgcolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                width: double.infinity,
                constraints: const BoxConstraints(maxWidth: 400),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/Time management.png',
                      height: isSmall ? 100 : 130,
                    ),
                    const SizedBox(height: 8),
                    CustomButton(
                      text: 'اضافة معاد كشف جديد',
                      width: double.infinity,
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddCheckupScreen(),
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
              'مواعيد اليوم',
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: txtcolor),
            ),
            const SizedBox(height: 10),
            ...List.generate(2, (index) => _buildAppointmentCard(size)),
          ]),
        ),
      ),
    );
  }

  Widget _buildAppointmentCard(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Center(
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: 400),
          height: 130,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                width: 69,
                height: 130,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(230, 239, 255, 1),
                ),
                child: const Center(
                  child: Text('  17\nالاحد',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: txtcolor)),
                ),
              ),
              const SizedBox(width: 8),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('موعد مع محمد ابراهيم',
                          style: TextStyle(fontSize: 16, color: txtcolor)),
                      Text('متابعه',
                          style: TextStyle(
                              fontSize: 13,
                              color: Color.fromRGBO(107, 112, 122, 1))),
                      Row(
                        children: [
                          Icon(
                            Icons.timer,
                            color: Color.fromRGBO(107, 112, 122, 1),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '30 نوفمبر - 11:00 صباحًا',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(107, 112, 122, 1)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
