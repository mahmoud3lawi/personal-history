// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:personal_history/const.dart';
import 'package:personal_history/screens/patientScreens/adwity/adwity.dart';
import 'package:personal_history/screens/patientScreens/mawaidy/mawaidy.dart';
import 'package:personal_history/screens/patientScreens/qr.dart';
import 'package:personal_history/screens/patientScreens/userProfile/profile.dart';
import 'package:personal_history/widgets/navBar.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePatient extends StatefulWidget {
  const HomePatient({super.key});

  @override
  _HomePatientState createState() => _HomePatientState();
}

class _HomePatientState extends State<HomePatient> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    const HomeScreenContent(),
    const Mawaidy(),
    const Adwity(),
    const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => QRScreen()),
          );
        },
        backgroundColor: kPrimaryColor,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: _screens[_selectedIndex],
    );
  }
}

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({super.key});

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          const SizedBox(height: 20),
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
                    MaterialPageRoute(builder: (context) => const Mawaidy()),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
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
          const SizedBox(height: 25),
          const Text(
            'تذكيرات الأدوية',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: txtcolor),
          ),
          const SizedBox(height: 5),
          _buildMedicineReminder(screenWidth),
          const SizedBox(height: 16),
          const Text(
            'المواعيد القادمة',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: txtcolor),
          ),
          const SizedBox(height: 5),
          _buildAppointmentCard('  17\nالأحد', screenWidth),
          const SizedBox(height: 5),
          _buildAppointmentCard('  18\nالإثنين', screenWidth),
        ],
      ),
    );
  }

  Widget _buildMedicineReminder(double screenWidth) {
    return Center(
      child: Container(
        width: screenWidth * 0.95,
        height: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              width: screenWidth * 0.18,
              height: 130,
              color: const Color.fromRGBO(230, 239, 255, 1),
              child: const Center(
                  child: Text('2:00\nمساء',
                      style: TextStyle(fontSize: 16, color: txtcolor))),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'باراسيتامول',
                            style: TextStyle(fontSize: 16, color: txtcolor),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'للصداع',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(107, 112, 122, 1)),
                          ),
                          SizedBox(height: 5),
                          Row(
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
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/image 16.png', height: 70),
                        const SizedBox(
                          height: 5,
                        ),
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
                                style:
                                    TextStyle(fontSize: 16, color: txtcolor)),
                          ],
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
    );
  }

  Widget _buildAppointmentCard(String dayText, double screenWidth) {
    return Center(
      child: Container(
        width: screenWidth * 0.95,
        height: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              width: screenWidth * 0.18,
              height: 130,
              color: const Color.fromRGBO(230, 239, 255, 1),
              child: Center(
                  child: Text(dayText,
                      style: TextStyle(fontSize: 16, color: txtcolor))),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'موعد مع : د. أحمد',
                      style: TextStyle(fontSize: 16, color: txtcolor),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'اخصائي باطنه وغدد',
                      style: TextStyle(
                          fontSize: 13,
                          color: Color.fromRGBO(107, 112, 122, 1)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
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
            ),
          ],
        ),
      ),
    );
  }
}
