import 'package:flutter/material.dart';
import 'package:myhealth/masuk.dart';

class Daftar extends StatelessWidget {
  const Daftar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF14482F),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              // Pindahkan ClipPath ke dalam scroll agar ikut scroll
              Positioned(
                child: ClipPath(
                  clipper: LengkungAtasClipper(),
                  child: Container(
                    height: 250,
                    color: const Color(0xFF0B3D2E),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    const Text(
                      'DAFTAR',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 150),
                    const Text(
                      'SELAMAT\nDATANG',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(190, 255, 255, 255),
                        fontSize: 30,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),

                    // NISN
                    _inputField(
                      icon: Icons.tag,
                      hint: 'NISN',
                    ),
                    const SizedBox(height: 20),

                    // Username
                    _inputField(
                      icon: Icons.person,
                      hint: 'Username',
                    ),
                    const SizedBox(height: 20),

                    // Password
                    _inputField(
                      icon: Icons.lock,
                      hint: 'Password',
                      isPassword: true,
                    ),

                    const SizedBox(height: 24),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/Masuk');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0B3D2E),
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'DAFTAR',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Sudah punya Akun? ',
                          style: TextStyle(color: Colors.white70, fontFamily: 'Poppins'),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => const Masuk()),
                            );
                          },
                          child: const Text(
                            'Masuk Sini',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 80),
                    const Text(
                      'Tidak enak badan saat belajar?\nHubungi petugas UKS di sekolah aja',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'Poppins',
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget input field (untuk menghindari duplikasi)
  Widget _inputField({required IconData icon, required String hint, bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.white),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white70, fontFamily: 'Poppins'),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 20),
        ),
        style: const TextStyle(color: Colors.white, fontFamily: 'Poppins'),
      ),
    );
  }
}

class LengkungAtasClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
