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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon / Logo Placeholder
            const Icon(
              Icons.health_and_safety,
              size: 100,
              color: Colors.white,
            ),
            const SizedBox(height: 24),
            
            // Title
            const Text(
              'MYHEALTH',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 60),

            // Tombol Masuk
            SizedBox(
              width: size.width * 0.8, // Responsif
              height: 55,
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
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('Masuk'),
              ),
            ),

            const SizedBox(height: 20),

            // Tombol Daftar
            SizedBox(
              width: size.width * 0.8,
              height: 55,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Daftar()),
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white, width: 2),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('Daftar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
