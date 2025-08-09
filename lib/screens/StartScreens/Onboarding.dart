import 'package:flutter/material.dart';
import 'package:personal_history/screens/StartScreens/type.dart';
import 'package:personal_history/const.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();
  int _currentPageIndex = 0;

  final List<Map<String, String>> _pages = [
    {
      "image": "assets/images/1.png",
      "title": "نظم بياناتك الصحية بكل سهولة",
      "subtitle": "نظم بياناتك الصحية بكل سهولة ، الحل الأمثل لإدارة السجلات الصحية. "
          "سواء كنت بحاجة إلى تتبع المواعيد، حفظ التقارير، أو مشاركة المعلومات عند الحاجة."
    },
    {
      "image": "assets/images/2.png",
      "title": "مشاركة التقارير بلمسة واحدة",
      "subtitle": "مشاركة التقارير بلمسة واحدة، لتسهيل التواصل بين المرضى والأطباء. "
          "سواء كنت بحاجة لإرسال تقرير لطبيبك أو مراجعة حالة مريضك، يوفر التطبيق طريقة سريعة وآمنة لنقل المعلومات الصحية المهمة."
    },
    {
      "image": "assets/images/3.png",
      "title": "خصوصيتك أولويتنا",
      "subtitle": "نحرص على حماية بياناتك الصحية من خلال أنظمة تشفير متقدمة وضمان سرية معلوماتك. "
          "يمكنك استخدام التطبيق بثقة كاملة، حيث أن أمان معلوماتك هو أساس كل ما نقدمه."
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: _pages.length,
            onPageChanged: (index) => setState(() => _currentPageIndex = index),
            itemBuilder: (context, index) => _buildPage(_pages[index]),
          ),
          if (_currentPageIndex < _pages.length - 1)
            Positioned(
              top: 65,
              left: 20,
              child: TextButton(
                onPressed: () => _controller.jumpToPage(_pages.length - 1),
                child: const Text("تخطي", style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
        ],
      ),
      bottomSheet: _currentPageIndex == _pages.length - 1
          ? _buildGetStartedButton()
          : _buildBottomNavigation(),
    );
  }

  Widget _buildPage(Map<String, String> page) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Image.asset(page["image"]!, height: 560)),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            page["title"]!,
            textAlign: TextAlign.right,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            page["subtitle"]!,
            textAlign: TextAlign.right,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildGetStartedButton() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const UserType()),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          minimumSize: const Size(double.infinity, 50),
        ),
        child: const Text("ابدأ", style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SmoothPageIndicator(
            controller: _controller,
            count: _pages.length,
            effect: const WormEffect(
              spacing: 8,
              dotColor: Colors.grey,
              dotWidth: 12,
              dotHeight: 12,
              activeDotColor: kPrimaryColor,
            ),
          ),
          TextButton(
            onPressed: () => _controller.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            ),
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
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
