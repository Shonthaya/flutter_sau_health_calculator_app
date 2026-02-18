import 'package:flutter/material.dart';

class BmrUi extends StatefulWidget {
  const BmrUi({super.key});

  @override
  State<BmrUi> createState() => _BmrUiState();
}

class _BmrUiState extends State<BmrUi> {
  // ตัวแปรและฟังก์ชันคำนวณ
  int gender = 0; // 0 = ชาย, 1 = หญิง
  TextEditingController weightCtrl = TextEditingController();
  TextEditingController heightCtrl = TextEditingController();
  TextEditingController ageCtrl = TextEditingController();
  double? bmrResult = 0.0;

  void calculateBmr() {
    setState(() {
      double? weight = double.tryParse(weightCtrl.text);
      double? height = double.tryParse(heightCtrl.text);
      int? age = int.tryParse(ageCtrl.text);
      if (weight != null && height != null && age != null && age > 0) {
        if (gender == 0) {
          bmrResult = (10 * weight) + (6.25 * height) - (5 * age) + 5;
        } else {
          bmrResult = (10 * weight) + (6.25 * height) - (5 * age) - 161;
        }
      } else {
        bmrResult = null;
      }
    });
  }

  void clearData() {
    setState(() {
      weightCtrl.clear();
      heightCtrl.clear();
      ageCtrl.clear();
      bmrResult = 0.0;
      gender = 0; // รีเซ็ตกลับเป็นชาย
    });
  }
  // ----------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                SizedBox(height: 50),
                Align(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'คำนวณหาค่าการเผาผลาญที่',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Align(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'ร่างกายต้องการ (BMR)',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Image.asset(
                  'assets/images/bmr.png',
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 40),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'เพศ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            gender = 0;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              gender == 0 ? Colors.blue[200] : Colors.white,
                          side: BorderSide(color: Colors.grey.shade300),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'ชาย',
                          style: TextStyle(
                            color: gender == 0 ? Colors.blue[900] : Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            gender = 1;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              gender == 1 ? Colors.blue[200] : Colors.white,
                          side: BorderSide(color: Colors.grey.shade300),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'หญิง',
                          style: TextStyle(
                            color: gender == 1 ? Colors.blue[900] : Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                // น้ำหนัก
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('น้ำหนัก (kg.)',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                TextField(
                  controller: weightCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'กรอกน้ำหนักของคุณ',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),

                SizedBox(height: 15),

                // ส่วนสูง
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('ส่วนสูง (cm.)',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                TextField(
                  controller: heightCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'กรอกส่วนสูงของคุณ',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),

                SizedBox(height: 15),

                // อายุ
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('อายุ (ปี)',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                TextField(
                  controller: ageCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'กรอกอายุของคุณ',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),

                SizedBox(height: 25),

                // ปุ่มคำนวณ
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: calculateBmr,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'คำนวณ BMR',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                // ปุ่มล้างข้อมูล
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: clearData,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'ล้างข้อมูล',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // ส่วนแสดงผล
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'BMR',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        (bmrResult != null)
                            ? bmrResult!.toStringAsFixed(2)
                            : '-',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.red[800],
                        ),
                      ),
                      Text(
                        'kcal/day',
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
