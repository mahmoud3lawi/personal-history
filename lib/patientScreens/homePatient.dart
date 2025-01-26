import 'package:flutter/material.dart';
import 'package:personal_history/const.dart';

class HomePatient extends StatefulWidget {
  @override
  _HomePatientState createState() => _HomePatientState();
}

class _HomePatientState extends State<HomePatient> {
  final List<Map<String, String>> days = [
    {'day': 'السبت', 'date': '1'},
    {'day': 'الأحد', 'date': '2'},
    {'day': 'الإثنين', 'date': '3'},
    {'day': 'الثلاثاء', 'date': '4'},
    {'day': 'الأربعاء', 'date': '5'},
    {'day': 'الخميس', 'date': '6'},
    {'day': 'الجمعة', 'date': '7'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start  ,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  child: Image.asset(
                    "images/man.png",
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'مرحبًا أحمد!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'نتمنى لك يومًا صحيًا.',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.grey,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 20),
            // Add a fixed height container to control the height of ListView
            Container(
              height: 78, // Adjust the height as needed
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: days.length, // Number of items to display
                itemBuilder: (context, index) {
                  return Container(
                    height: 78,
                    width: 52,
                    margin:
                        EdgeInsets.only(right: 16), // Add space between items
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            days[index]['day']!, // Access the day
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            days[index]['date']!, // Access the date
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'تذكيرات الأدوية',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5,),
            Container()
          ],
        ),
      ),
    );
  }
}
