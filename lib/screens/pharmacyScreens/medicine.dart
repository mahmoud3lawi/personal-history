// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:personal_history/const.dart';
import 'package:personal_history/widgets/customTextField.dart';

class Medicine extends StatefulWidget {
  const Medicine({super.key});

  @override
  State<Medicine> createState() => _MedicineState();
}

class _MedicineState extends State<Medicine>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(size.width * 0.04),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.02),

                    // صورة الدواء
                    GestureDetector(
                      onTap: () {
                        // كود اختيار الصورة
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.image_outlined,
                            size: size.width * 0.15,
                            color: Colors.grey,
                          ),
                          SizedBox(height: size.height * 0.01),
                          Text(
                            "أضف صورة الدواء",
                            textScaleFactor: textScale,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFF1B2A4A),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: size.height * 0.04),

                    // اسم الدواء + ملاحظات
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'اسم الدواء',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: txtcolor),
                        ),
                        FormFieldWidget(hintText: 'من فضلك ادخل اسم الدواء'),
                        Text(
                          'ملاحظات',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: txtcolor),
                        ),
                        FormFieldWidget(hintText: 'يمكن استبداله '),
                      ],
                    ),

                    SizedBox(height: size.height * 0.02),

                    // TabBar
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                      child: TabBar(
                        controller: _tabController,
                        labelColor: kPrimaryColor,
                        unselectedLabelColor: txtcolor,
                        indicatorColor: kPrimaryColor,
                        indicatorWeight: 2,
                        labelStyle: TextStyle(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                        tabs: const [
                          Tab(text: "غير متوفر"),
                          Tab(text: "متوفر بعد"),
                        ],
                      ),
                    ),

                    // TabBarView لكل تاب محتوى مختلف
                    SizedBox(
                      height: size.height * 0.15,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          Container(),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              FormFieldWidget(hintText: 'متوفر بعد يومين '),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // زر التالي
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.all(size.width * 0.02),
              child: SizedBox(
                width: double.infinity,
                height: size.height * 0.06,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "تعديل",
                    textScaleFactor: textScale,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
