import 'package:flutter/material.dart';
import 'package:myhealth/daftar.dart';
import 'masuk.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF14482F),
      body: Center(
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 32.0),
    child: Column(
      mainAxisSize: MainAxisSize.min, // agar height tidak memenuhi seluruh layar
      children: [
        Image.asset(
          'assets/images/logo.png',
          width: size.width * 0.5,
          height: size.width * 0.5,
        ),
        const SizedBox(height: 16),
        const Text(
          'MYHEALTH',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 40),
        // Tombol Masuk
        SizedBox(
          width: size.width * 0.6,
          height: 44,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Masuk()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFF14482F),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              textStyle: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            child: const Text('Masuk'),
          ),
        ),
        const SizedBox(height: 14),
        // Tombol Daftar
        SizedBox(
          width: size.width * 0.6,
          height: 44,
          child: OutlinedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Daftar()),
              );
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.white, width: 1.5),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              textStyle: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            child: const Text('Daftar'),
          ),
        ),
      ],
    ),
  ),
),

    );
  }
}
