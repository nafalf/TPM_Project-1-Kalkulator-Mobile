import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  TextEditingController inputController = TextEditingController();
  String result = "   ";

  void calculateResult() {
    try {
      // Standarisasi input: Ubah semua koma (`,`) menjadi titik (`.`)
      String sanitizedInput = inputController.text.replaceAll(',', '.');

      // Ekstrak angka dan operator dengan regex 
      RegExp numberPattern = RegExp(r'\d+(\.\d+)?'); 
      RegExp operatorPattern = RegExp(r'[+-]');

      List<String> numbers = numberPattern
          .allMatches(sanitizedInput)
          .map((e) => e.group(0)!)
          .toList();
      List<String> operators = operatorPattern
          .allMatches(sanitizedInput)
          .map((e) => e.group(0)!)
          .toList();

      if (numbers.isEmpty) {
        setState(() {
          result = "ERROR";
        });
        return;
      }

      double total = double.parse(numbers[0]);

      for (int i = 0; i < operators.length; i++) {
        double num = double.parse(numbers[i + 1]);
        if (operators[i] == "+") {
          total += num;
        } else if (operators[i] == "-") {
          total -= num;
        }
      }

      setState(() {
        result = total.toString();
      });
    } catch (e) {
      setState(() {
        result = "ERROR";
      });
    }
  }

  void clearInput() {
    setState(() {
      inputController.clear();
      result = "";
    });
  }

  void addToInput(String value) {
    setState(() {
      inputController.text += value;
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
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "KALKULATOR",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.purple.shade900,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Input Angka yang akan dilakukan Penjumlahan/Pengurangan",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.purple.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: inputController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildButton("C", clearInput),
                _buildButton("+", () => addToInput("+")),
                _buildButton("-", () => addToInput("-")),
                _buildButton("=", calculateResult),
              ],
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.purple.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text(
                    "Hasil Nilai",
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      result,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple.shade900,
                      ),
                    ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple.shade900,
          padding: EdgeInsets.all(20),
          shape: CircleBorder(),
        ),
        child: Text(
          label,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
