// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:personal_history/screens/StartScreens/splash.dart';

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
      localizationsDelegates: const [
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
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
