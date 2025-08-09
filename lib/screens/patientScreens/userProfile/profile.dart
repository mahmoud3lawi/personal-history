import 'package:flutter/material.dart';
import 'package:personal_history/const.dart';
import 'package:personal_history/screens/patientScreens/userProfile/editMedical.dart';
import 'package:personal_history/screens/patientScreens/userProfile/medical.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: bgcolor,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: Row(
                  children: [
                    Container(
                      height: screenWidth * 0.18,
                      width: screenWidth * 0.18,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset("assets/images/man.png"),
                    ),
                    const SizedBox(width: 15),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('مرحبًا أحمد!',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Text('ahmedali@gmail.com',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.grey),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const TabBar(
                indicatorColor: kPrimaryColor,
                labelColor: kPrimaryColor,
                unselectedLabelColor: Color.fromRGBO(142, 150, 162, 1),
                tabs: [
                  Tab(text: 'المعلومات الشخصية'),
                  Tab(text: 'السجل الطبي'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _personalInfoTab(),
                    _medicalFileTab(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _personalInfoTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          _buildFieldRow('احمد علي محمد', Icons.person),
          _buildFieldRow('ahmedali@gmail.com', Icons.email),
          _buildFieldRow('**********', Icons.lock),
          _buildFieldRow('01067875828', Icons.phone),
          _buildFieldRow('123 شارع التحرير، الدقي', Icons.location_on),
        ],
      ),
    );
  }

  Widget _medicalFileTab(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Wrap(
            spacing: 12,
            runSpacing: 16,
            children: [
              _medicalCard(context, 'الملف الطبي', 'assets/images/m1.png',
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const MedicalProfile()))),
              _medicalCard(context, 'التحاليل', 'assets/images/m2.png',
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const EditMedical()))),
              _medicalCard(context, 'الأدوية', 'assets/images/m3.png'),
              _medicalCard(context, 'روشتاتي', 'assets/images/m4.png'),
              _medicalCard(context, 'العمليات السابقة', 'assets/images/m5.png'),
              _medicalCard(context, 'الاشعة', 'assets/images/m6.png'),
            ],
          );
        },
      ),
    );
  }

  Widget _medicalCard(BuildContext context, String title, String imagePath,
      {VoidCallback? onTap}) {
    final screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = screenWidth / 3 - 24;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: cardWidth,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(247, 248, 250, 1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 50,
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: txtcolor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFieldRow(String text, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.right,
              style: const TextStyle(
                  color: Color.fromRGBO(142, 150, 162, 1), fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
