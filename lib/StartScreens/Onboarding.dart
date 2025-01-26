import 'package:flutter/material.dart';
import 'package:personal_history/StartScreens/type.dart';
import 'package:personal_history/const.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = PageController();
  bool isLastPage = false;
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: Stack(
        children: [
          PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                currentPageIndex = index; // تحديث الصفحة الحالية
                isLastPage = index == 2;
              });
            },
            children: [
              buildPage(
                image: "images/1.png",
                title: "نظم بياناتك الصحية بكل سهولة",
                subtitle:
                    "نظم بياناتك الصحية بكل سهولة ، الحل الأمثل لإدارة\nالسجلات الصحية. سواء كنت بحاجة إلى تتبع المواعيد،\nحفظ التقارير، أو مشاركة المعلومات عند الحاجة.",
              ),
              buildPage(
                image: "images/2.png",
                title: "مشاركة التقارير بلمسة واحدة",
                subtitle:
                    "مشاركة التقارير بلمسة واحدة، لتسهيل التواصل بين\nالمرضى والأطباء. سواء كنت بحاجة لإرسال تقرير\nلطبيبك أو مراجعة حالة مريضك، يوفر التطبيق طريقة\nسريعة وآمنة لنقل المعلومات الصحية المهمة.",
              ),
              buildPage(
                image: "images/3.png",
                title: "خصوصيتك أولويتنا",
                subtitle:
                    "نحرص على حماية بياناتك الصحية من خلال أنظمة\nتشفير متقدمة وضمان سرية معلوماتك. يمكنك استخدام\nالتطبيق بثقة كاملة، حيث أن أمان معلوماتك هو أساس\nكل ما نقدمه.",
              ),
            ],
          ),
          // عرض زر "تخطي" فقط في أول صفحتين
          if (currentPageIndex < 2)
            Positioned(
              top: 65,
              left: 20,
              child: TextButton(
                onPressed: () => controller.jumpToPage(2),
                child: const Text(
                  "تخطي",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
        ],
      ),
      bottomSheet:
          isLastPage ? buildGetStartedButton() : buildBottomNavigation(),
    );
  }

  Widget buildPage(
      {required String image,
      required String title,
      required String subtitle}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Image.asset(
            image,
            height: 560,
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              title,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            subtitle,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget buildGetStartedButton() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UserType(),
              ));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          minimumSize: const Size(double.infinity, 50),
        ),
        child: const Text(
          "ابدأ",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget buildBottomNavigation() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SmoothPageIndicator(
            controller: controller,
            count: 3,
            effect: const WormEffect(
              spacing: 8,
              dotColor: Colors.grey,
              dotWidth: 12,
              dotHeight: 12,
              activeDotColor: kPrimaryColor,
            ),
          ),
          TextButton(
            onPressed: () {
              controller.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: kPrimaryColor,
              ),
              width: 90,
              height: 60,
              child: const Center(
                child: Text(
                  "التالي",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
