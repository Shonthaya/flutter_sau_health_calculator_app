import 'package:flutter/material.dart';

class BmiUi extends StatefulWidget {
  const BmiUi({super.key});

  @override
  State<BmiUi> createState() => _BmiUiState();
}

class _BmiUiState extends State<BmiUi> {
  // ตัวแปรสำหรับรับค่าและเก็บผลลัพธ์
  TextEditingController weightCtrl = TextEditingController();
  TextEditingController heightCtrl = TextEditingController();
  // เปลี่ยนเป็น double? เพื่อรองรับ null
  double? bmiResult = 0.0;

  // ฟังก์ชันคำนวณ BMI
  void calculateBMI() {
    setState(() {
      double? weight = double.tryParse(weightCtrl.text);
      double? height = double.tryParse(heightCtrl.text);
      if (weight != null && height != null && height > 0) {
        bmiResult = weight / ((height / 100) * (height / 100));
      } else {
        bmiResult = null;
      }
    });
  }

  // ฟังก์ชันล้างข้อมูล
  void clearData() {
    setState(() {
      weightCtrl.clear();
      heightCtrl.clear();
      bmiResult = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'คำนวณหาค่าดัชนีมวลกาย (BMI)',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Image.asset(
                  'assets/images/bmi.png',
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 20),

                // 1. ช่องกรอกน้ำหนัก
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
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 15),

                // 2. ช่องกรอกส่วนสูง
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
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 20),

                // 3. ปุ่มคำนวณ (สีส้ม)
                SizedBox(
                  width: double.infinity, // ความกว้างเต็มจอ
                  height: 50,
                  child: ElevatedButton(
                    onPressed: calculateBMI,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'คำนวณ BMI',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                // 4. ปุ่มล้างข้อมูล (สีเทา)
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: clearData,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
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

                // 5. ส่วนแสดงผล (กล่องสีเทาอ่อน)
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
                        'BMI',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        (bmiResult != null)
                            ? bmiResult!.toStringAsFixed(2)
                            : '-', // ถ้า null แสดง -
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.red[800], // สีแดงเข้มตามรูป
                        ),
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
