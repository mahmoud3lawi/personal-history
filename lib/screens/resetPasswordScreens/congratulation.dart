import 'package:flutter/material.dart';
import 'package:personal_history/const.dart';

class Congrats extends StatefulWidget {
  const Congrats({super.key});

  @override
  State<Congrats> createState() => _CongratsState();
}

class _CongratsState extends State<Congrats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 190,
              ),
              Container(
                  height: 161,
                  width: 161,
                  child: Image.asset(
                    "images/cir.png",
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  )),
              SizedBox(
                height: 20,
              ),
              Text('تهانينا',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                'لقد قمت بتغيير كلمة المرور بنجاح ',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
