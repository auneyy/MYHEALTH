import 'package:flutter/material.dart';
import 'custom_bottom_navbar.dart';
import 'custom_appbar.dart';
import 'chat_page.dart'; // ✅ Tambahkan ini

class CariPetugas extends StatelessWidget {
  const CariPetugas({super.key});

  @override
  Widget build(BuildContext context) {
    // Contoh data petugas
    final List<Map<String, dynamic>> petugasList = [
      {
        'nama': 'Cristiano Ronaldo',
        'kelas': 'Petugas UKS X RPL B',
        'isOnline': true,
      },
      {
        'nama': 'Cristiano Ronaldo',
        'kelas': 'Petugas UKS X RPL B',
        'isOnline': true,
      },
      {
        'nama': 'Cristiano Ronaldo',
        'kelas': 'Petugas UKS X RPL B',
        'isOnline': false,
      },
    ];

    return Scaffold(
      appBar: const CustomAppBar(title: 'PETUGAS UKS'),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/jadwal');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/screening');
          }
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔙 Tombol kembali
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Color(0xFF14482F)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),

            // 🔍 Search Bar
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
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

            const SizedBox(height: 20),

            // 📋 Daftar Petugas
            Expanded(
              child: ListView.builder(
                itemCount: petugasList.length,
                itemBuilder: (context, index) {
                  final petugas = petugasList[index];
                  return GestureDetector(
                    onTap: () {
                      if (petugas['isOnline']) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatPage(
                              namaPetugas: petugas['nama'],
                            ),
                          ),
                        );
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(23),
                      decoration: BoxDecoration(
                        color: const Color(0xFF14482F),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.person, color: Colors.black54),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  petugas['nama'],
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  petugas['kelas'],
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                petugas['isOnline'] ? 'Online' : 'Offline',
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Switch(
                                value: petugas['isOnline'],
                                onChanged: (_) {},
                                activeColor: Colors.greenAccent,
                                inactiveThumbColor: Colors.red,
                                inactiveTrackColor: Colors.red[200],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
