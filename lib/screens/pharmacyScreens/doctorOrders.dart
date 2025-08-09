// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:personal_history/const.dart';

class DoctorOrders extends StatefulWidget {
  @override
  State<DoctorOrders> createState() => _DoctorOrdersState();
}

class _DoctorOrdersState extends State<DoctorOrders> {
  List<bool> selections = [true, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: bgcolor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text(
          'الطلبات',
          style: TextStyle(color: txtcolor),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "بعض الأدوية غير متوفرة في الصيدلية.\nهل تود تعديل الوصفة؟",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w500, color: txtcolor),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 2,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: bgcolor,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // ✅❌ buttons
                          Column(
                            children: [
                              Image.asset(
                                "assets/images/image 16.png", // تأكد من إضافتها في pubspec
                                width: 60,
                                height: 60,
                              ),
                            ],
                          ),
                          const SizedBox(width: 12),
                          // text content
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "باراسيتامول",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  index == 0 ? "يتوفر بعد يومين" : "غير متوفر",
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  "استبدال بـ بانادول 500mg",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                ),
                              ],
                            ),
                          ),

                          CircleAvatar(
                            radius: 20,
                            backgroundColor: selections[index]
                                ? const Color.fromRGBO(88, 147, 255, 1)
                                : Colors.grey.shade200,
                            child: IconButton(
                              icon: Icon(Icons.check,
                                  color: selections[index]
                                      ? Colors.white
                                      : Colors.grey),
                              onPressed: () {
                                setState(() {
                                  selections[index] = true;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 8),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: selections[index]
                                ? Colors.grey.shade200
                                : const Color.fromRGBO(88, 147, 255, 1),
                            child: IconButton(
                              icon: Icon(Icons.close,
                                  color: selections[index]
                                      ? Colors.grey
                                      : Colors.white),
                              onPressed: () {
                                setState(() {
                                  selections[index] = false;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "تعديل",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
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
