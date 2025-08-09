// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:personal_history/const.dart';

class PharmacyNotf extends StatelessWidget {
  final List<String> todayNotifications = [
    'د. أحمد أرسل روشتة جديدة للمريض محمد علي',
    'روشتة جديدة تم استلامها من المريض نورا شريف',
  ];

  final List<String> weekNotifications = [
    'د. أحمد أرسل روشتة جديدة للمريض محمد علي',
    'د. أحمد أرسل روشتة جديدة للمريض محمد علي',
    'د. أحمد أرسل روشتة جديدة للمريض محمد علي',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgcolor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Center(
            child: Text(
          'اشعارات الصيدلي',
          style: TextStyle(color: txtcolor),
        )),
      ),
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Today's notifications
            _sectionTitle('اليوم'),
            ...todayNotifications.map((msg) => NotificationTile(
                  message: msg,
                  isNew: true,
                )),
            // This week's notifications
            _sectionTitle('هذا الاسبوع'),
            ...weekNotifications.map((msg) => NotificationTile(
                  message: msg,
                  isNew: false,
                )),
          ],
        ),
      ),
    );
  }

  Padding _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: txtcolor),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String message;
  final bool isNew;

  const NotificationTile({
    super.key,
    required this.message,
    this.isNew = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 8,
      minVerticalPadding: 0,
      leading: const Icon(Icons.mail_outline,
          color: Color.fromRGBO(88, 147, 255, 1)),
      title: Text(
        message,
        style: const TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 1)),
      ),
      trailing: isNew
          ? const Icon(Icons.circle, color: Colors.red, size: 10)
          : const SizedBox(width: 10),
    );
  }
}
