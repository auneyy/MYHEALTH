import 'package:flutter/material.dart';
import 'custom_appbar.dart';
import 'custom_bottom_navbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Home'),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 1, // index untuk Home
        onTap: (index) {
          // Navigasi bisa disesuaikan
          if (index == 0) {
            Navigator.pushNamed(context, '/jadwal');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/screening');
          }
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hi Alexander!',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Selamat Siang',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 50),
            // Search bar
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.search),
                      hintText: 'Search',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
            // Kartu Selamat Datang
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFF14482F), width: 2),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Kiri: Teks
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Selamat Datang',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF14482F),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Apakah Kamu punya masalah?\nKonsultasi disini aja!',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Kanan: Gambar PNG
                  Expanded(
                    flex: 1,
                    child: Image.asset('assets/images/orang.png', height: 150),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            // Dua tombol kotak
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/petugas',
                      ); // ke cari petugas ygy
                    },
                    child: Container(
                      height: 150,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF14482F),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.person, color: Colors.white, size: 30),
                          SizedBox(height: 10),
                          Text(
                            'Cari Petugas\nUKS Online',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Expanded(
  child: GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, '/petugas'); // Ganti dengan route yang sesuai
    },
    child: Container(
      height: 150,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF14482F),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.medical_information_sharp, color: Colors.white, size: 30),
          SizedBox(height: 20),
          Text(
            'Tanya Dokter\nUKS Kamu',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  ),
),

              ],
            ),
            const SizedBox(height: 18),
            // Kotak Ambil Obat
            Container(
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: Color(0xFF1A3427),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  // Kiri: Teks
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Ambil Obat yang Telah\ndi Pesan',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Ambil Obat',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Kanan: Ikon
                  Expanded(
                    flex: 1,
                    child: Image.asset('assets/images/obat.png', height: 95),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
