import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bmi_ui.dart';
import 'about_ui.dart';
import 'bmr_ui.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

// สร้างตัวแปรเก็บ index ที่เลือกของ BottomNavigationBar Item
int barItemIndex = 1;

// สร้างตัวแปรเก็บ UI ที่จะเอามาแสดงตามแต่ละ BarItem
List showUI = [
  BmiUi(),
  AboutUi(),
  BmrUi(),
];

class _HomeUiState extends State<HomeUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'Body Health Calculator',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (paramValue) {
          setState(() {
            barItemIndex = paramValue;
          });
        },
        selectedItemColor: Colors.deepOrange,
        currentIndex: barItemIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'BMI',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.heartCircleBolt),
            label: 'BMR',
          ),
        ],
      ),
      body: showUI[barItemIndex],
    );
  }
}
