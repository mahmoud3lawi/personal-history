import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:personal_history/screens/adwity/addAdwity.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal History', // اسم التطبيق
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      locale: const Locale('ar', 'SA'), // تعيين اللغة العربية
      supportedLocales: const [
        Locale('en', 'US'), // الإنجليزية
        Locale('ar', 'SA'), // العربية
      ],
      // إضافة الـ localizationsDelegates لدعم الترجمة للغة العربية
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        if (supportedLocales.contains(locale)) {
          return locale;
        }
        return const Locale(
            'ar', 'SA'); // العودة إلى اللغة العربية إذا كانت غير مدعومة
      },
      home: Addadwity(),
      debugShowCheckedModeBanner: false,
    );
  }
}
