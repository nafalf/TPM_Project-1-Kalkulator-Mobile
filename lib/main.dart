import 'package:flutter/material.dart';
import 'login.dart'; 
import 'our_team.dart';
import 'calculator_page.dart';
import 'GanjilGenapPage.dart';
import 'jumlah.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(), // Aplikasi dimulai dari halaman login
    );
  }
}


class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2E2E5D), 
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {}, // Fungsi kembali 
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.pink.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "Menu Utama",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                _buildMenuItem(Icons.group, "OUR TEAM", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OurTeamPage()),
                  );
                }),
                _buildMenuItem(Icons.format_list_numbered, "GANJIL/GENAP", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GanjilGenapPage()),
                  );
                }),
                _buildMenuItem(Icons.calculate, "KALKULATOR", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CalculatorPage()),
                  );
                }),
                _buildMenuItem(Icons.help_outline, "JUMLAH TOTAL ANGKA", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => JumlahAngkaApp()),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 60, color: Colors.white),
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
