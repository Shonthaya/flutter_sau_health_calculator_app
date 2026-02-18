import 'package:flutter/material.dart';

class AboutUi extends StatefulWidget {
  const AboutUi({super.key});

  @override
  State<AboutUi> createState() => _AboutUiState();
}

class _AboutUiState extends State<AboutUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              'Body Health Calculator',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/images/logo.png',
              width: 200,
              height: 200,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'คำนวณหาค่าดัชนีมวลกาย (BMI)',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w200,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'คำนวณหาค่าแคลลอรี่ที่ร่างกายต้องการในแต่ละวัน (BMR)',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w200,
              ),
            ),
            SizedBox(
              height: 180,
            ),
            Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Logosau-02.png/250px-Logosau-02.png',
              width: 100,
              height: 100,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Developed by Shonthaya S.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w200,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
