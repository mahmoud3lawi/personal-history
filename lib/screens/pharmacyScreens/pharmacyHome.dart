// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:personal_history/const.dart';
import 'package:personal_history/screens/pharmacyScreens/pharmacyNotf.dart';
import 'package:table_calendar/table_calendar.dart';

class PharmacyHome extends StatefulWidget {
  @override
  _PharmacyHomeState createState() => _PharmacyHomeState();
}

class _PharmacyHomeState extends State<PharmacyHome> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset("assets/images/man.png"),
                  ),
                  const SizedBox(width: 15),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'مرحبًا أحمد!',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: txtcolor),
                        ),
                        Text(
                          'نتمنى لك يومًا صحيًا.',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: txtcolor),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications, color: Colors.grey),
                    onPressed: () {
                      Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  PharmacyNotf()),
                  );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Calendar
              TableCalendar(
                locale: 'ar_EG',
                firstDay: DateTime(2020),
                lastDay: DateTime(2050),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                startingDayOfWeek: StartingDayOfWeek.saturday,
                calendarFormat: CalendarFormat.week,
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Color.fromRGBO(106, 149, 122, 1),
                    shape: BoxShape.circle,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'الطلبات',
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: txtcolor),
              ),
              const SizedBox(height: 10),

              Expanded(
                child: ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return RequestCard();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RequestCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 358,
        height: 66,
        decoration: BoxDecoration(
            color: bgcolor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey, width: 1)),
        child: const ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/man.png'),
          ),
          title: Text(
            'د. أحمد أرسل روشتة جديدة للمريض',
            style: TextStyle(
                fontWeight: FontWeight.w400, color: Color.fromRGBO(0, 0, 0, 1), fontSize: 16),
          ),
          subtitle: Text('محمد علي',
              style: TextStyle(
                  fontWeight: FontWeight.w400, color: Color.fromRGBO(0, 0, 0, 1), fontSize: 16)),
          trailing: Icon(Icons.arrow_back_ios,
              color: Color.fromRGBO(88, 147, 255, 1)),
        ),
      ),
    );
  }
}
