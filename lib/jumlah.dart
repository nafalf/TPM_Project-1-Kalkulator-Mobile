import 'package:flutter/material.dart';
import 'main.dart'; // Import the main.dart file to access MainMenu

void main() {
  runApp(JumlahAngkaApp());
}

class JumlahAngkaApp extends StatelessWidget {
  const JumlahAngkaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JumlahAngkaPage(),
    );
  }
}

class JumlahAngkaPage extends StatefulWidget {
  const JumlahAngkaPage({super.key});

  @override
  _JumlahAngkaPageState createState() => _JumlahAngkaPageState();
}

class _JumlahAngkaPageState extends State<JumlahAngkaPage> {
  TextEditingController inputController = TextEditingController();
  String countResult = "";
  String sumResult = "";

  void calculateCountAndSum() {
    String input = inputController.text;
    String digitsOnly = input.replaceAll(RegExp(r'[^0-9]'), '');
    int count = digitsOnly.length;
    int sum = digitsOnly
        .split('')
        .fold(0, (prev, element) => prev + int.parse(element));

    setState(() {
      countResult = count.toString();
      sumResult = sum.toString();
    });
  }

  void clearInput() {
    setState(() {
      inputController.clear();
      countResult = "";
      sumResult = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8E9F0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainMenu()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "JUMLAH ANGKA",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF611EB4),
              ),
            ),
            SizedBox(height: 12),
            Text(
              "Silahkan input angka untuk melihat berapa Jumlahnya!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.purple.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: inputController,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildButton("C", clearInput),
                SizedBox(width: 16),
                _buildButton("=", calculateCountAndSum),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.purple.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Jumlah Input Angka",
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                      Container(
                        width: 50,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          countResult,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple.shade900,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Jumlah Total",
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                      Container(
                        width: 50,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          sumResult,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple.shade900,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String label, VoidCallback onTap) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF611EB4),
        padding: EdgeInsets.all(20),
        shape: CircleBorder(),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
