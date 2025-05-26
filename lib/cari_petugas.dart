import 'package:flutter/material.dart';
import 'custom_bottom_navbar.dart';
import 'custom_appbar.dart';
import 'chat_page.dart'; // ✅ Tambahkan ini

class CariPetugas extends StatefulWidget {
  const CariPetugas({super.key});

  @override
  State<CariPetugas> createState() => _CariPetugasState();
}

class _CariPetugasState extends State<CariPetugas> {
  List<Map<String, dynamic>> petugasList = [
    {
      'nama': 'Cristiano Ronaldo',
      'kelas': 'Petugas UKS X RPL B',
      'isOnline': true,
    },
    {
      'nama': 'Lionel Messi',
      'kelas': 'Petugas UKS XI RPL A',
      'isOnline': true,
    },
    {
      'nama': 'Kylian Mbappé',
      'kelas': 'Petugas UKS XII RPL C',
      'isOnline': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Petugas UKS'),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 2,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/jadwal');
              break;
            case 2:
              Navigator.pushNamed(context, '/profil');
              break;
            case 3:
              Navigator.pushNamed(context, '/obat');
              break;
            case 4:
              Navigator.pushNamed(context, '/riwayat');
              break;
          }
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Align(
      alignment: Alignment.centerLeft,
      child: TextButton.icon(
        onPressed: () {
          Navigator.pushNamed(context, '/home');
        },
        icon: const Icon(Icons.arrow_back, color: Color(0xFF14482F)),
        label: const Text(
          'Kembali',
          style: TextStyle(
            color: Color(0xFF14482F),
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    ),

    const SizedBox(height: 10),

            // Search Bar
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

            // Daftar Petugas
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
                                onChanged: null,
                                activeColor: Colors.greenAccent,
                                inactiveThumbColor: const Color.fromARGB(255, 223, 255, 231),
                                inactiveTrackColor: Colors.red,
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

