import 'package:flutter/material.dart';
import 'package:personal_history/const.dart';

class MedicalProfile extends StatelessWidget {
  const MedicalProfile({super.key});

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
        centerTitle: true,
        title: const Text(
          'الملف الطبي',
          style: TextStyle(color: txtcolor),
        ),
      ),
      backgroundColor: bgcolor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: screenWidth * 0.18,
                  width: screenWidth * 0.18,
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
                        'ahmedali@gmail.com',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: txtcolor),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.grey),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 24),

            // 🟦 Responsive Info Cards
            LayoutBuilder(
              builder: (context, constraints) {
                double maxCardWidth = 160;
                int cardsPerRow =
                    (constraints.maxWidth / (maxCardWidth + 12)).floor();
                double cardWidth =
                    (constraints.maxWidth - ((cardsPerRow - 1) * 12)) /
                        cardsPerRow;

                return Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    _infoCard(
                        icon: Icons.male,
                        label: 'الجنس',
                        value: 'ذكر',
                        width: cardWidth),
                    _infoCard(
                        icon: Icons.trending_up,
                        label: 'العمر',
                        value: '40',
                        width: cardWidth),
                    _infoCard(
                        icon: Icons.water_drop,
                        label: 'فصيلة الدم',
                        value: '+O',
                        width: cardWidth),
                    _infoCard(
                        icon: Icons.pan_tool,
                        label: 'اليد الاساسية',
                        value: 'اليمني',
                        width: cardWidth),
                    _infoCard(
                        icon: Icons.monitor_weight,
                        label: 'الوزن',
                        value: '70 kg',
                        width: cardWidth),
                    _infoCard(
                        icon: Icons.height,
                        label: 'الطول',
                        value: '180 cm',
                        width: cardWidth),
                  ],
                );
              },
            ),

            const SizedBox(height: 24),

            // 🟦 Long Info Cards
            _longInfoCard(
              icon: Icons.medical_services_outlined,
              title: 'الامراض المزمنه',
              content: 'ارتفاع ضغط الدم',
            ),
            const SizedBox(height: 12),
            _longInfoCard(
              icon: Icons.warning_amber_outlined,
              title: 'الحساسية',
              content: 'حساسية من الفول السوداني',
            ),
            const SizedBox(height: 12),
            _longInfoCard(
              icon: Icons.family_restroom,
              title: 'الامراض الوراثية',
              content: 'الدوالي',
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoCard({
    required IconData icon,
    required String label,
    required String value,
    required double width,
  }) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(178, 187, 203, 1)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 20, color: txtcolor),
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(
                    color: txtcolor, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Widget _longInfoCard({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(178, 187, 203, 1)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: txtcolor),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: txtcolor),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(content),
        ],
      ),
    );
  }
}
