import 'package:flutter/material.dart';
import 'package:myhealth/custom_bottom_navbar.dart';

class JadwalPetugasUKS extends StatefulWidget {
  const JadwalPetugasUKS({Key? key}) : super(key: key);

  @override
  State<JadwalPetugasUKS> createState() => _JadwalPetugasUKSState();
}

class _JadwalPetugasUKSState extends State<JadwalPetugasUKS> {
  int selectedWeek = 0;

  // Data contoh jadwal petugas
  final List<Map<String, dynamic>> jadwalPetugas = [
    {
      'hari': 'Senin',
      'tanggal': '20 Mei 2025',
      'shift_pagi': {'nama': 'Dr. Sarah', 'jam': '07:00 - 12:00'},
      'shift_siang': {'nama': 'Ns. Budi', 'jam': '12:00 - 15:00'},
    },
    {
      'hari': 'Selasa',
      'tanggal': '21 Mei 2025',
      'shift_pagi': {'nama': 'Dr. Ahmad', 'jam': '07:00 - 12:00'},
      'shift_siang': {'nama': 'Ns. Sari', 'jam': '12:00 - 15:00'},
    },
    {
      'hari': 'Rabu',
      'tanggal': '22 Mei 2025',
      'shift_pagi': {'nama': 'Dr. Lisa', 'jam': '07:00 - 12:00'},
      'shift_siang': {'nama': 'Ns. Andi', 'jam': '12:00 - 15:00'},
    },
    {
      'hari': 'Kamis',
      'tanggal': '23 Mei 2025',
      'shift_pagi': {'nama': 'Dr. Sarah', 'jam': '07:00 - 12:00'},
      'shift_siang': {'nama': 'Ns. Maya', 'jam': '12:00 - 15:00'},
    },
    {
      'hari': 'Jumat',
      'tanggal': '24 Mei 2025',
      'shift_pagi': {'nama': 'Dr. Ahmad', 'jam': '07:00 - 12:00'},
      'shift_siang': {'nama': 'Ns. Budi', 'jam': '12:00 - 15:00'},
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF14482F)),
          onPressed: () {
            Navigator.pushNamed(
              context,
              ('/home'),
            ); // kembali ke halaman sebelumnya
          },
        ),
        title: const Text(
          'Jadwal Petugas UKS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF14482F),
            fontFamily: 'Poppins',
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 231, 231, 231),
        elevation: 0,
        centerTitle: true,
      ),
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
      body: Column(
        children: [
          // Header dengan pemilih minggu
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xFF14482F),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                const Text(
                  'Minggu ke-3 Mei 2025',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        // Navigasi ke minggu sebelumnya
                      },
                      icon: const Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const Text(
                      '20 - 24 Mei 2025',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Navigasi ke minggu selanjutnya
                      },
                      icon: const Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // List jadwal
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.builder(
                itemCount: jadwalPetugas.length,
                itemBuilder: (context, index) {
                  final jadwal = jadwalPetugas[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Header hari dan tanggal
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  jadwal['hari'],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF14482F),
                                  ),
                                ),
                                Text(
                                  jadwal['tanggal'],
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),

                            // Shift Pagi
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.orange[50],
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.orange[200]!),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.wb_sunny,
                                    color: Colors.orange[600],
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Shift Pagi',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          jadwal['shift_pagi']['nama'],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          jadwal['shift_pagi']['jam'],
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 8),

                            // Shift Siang
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.blue[50],
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.blue[200]!),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.wb_sunny_outlined,
                                    color: Colors.blue[600],
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Shift Siang',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          jadwal['shift_siang']['nama'],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          jadwal['shift_siang']['jam'],
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ],
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
                },
              ),
            ),
          ),
        ],
      ),

      // Floating Action Button untuk menambah/edit jadwal
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showTambahJadwalDialog(context);
        },
        backgroundColor: Color(0xFF14482F),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _showTambahJadwalDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Tambah/Edit Jadwal'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Nama Petugas',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Hari',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Jam Kerja',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implementasi simpan jadwal
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Jadwal berhasil disimpan!'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[600],
                foregroundColor: Colors.white,
              ),
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }
}

// Widget untuk menampilkan ringkasan petugas
class RingkasanPetugas extends StatelessWidget {
  const RingkasanPetugas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ringkasan Petugas',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _buildPetugasItem('Dr. Sarah', 'Dokter', '2 shift minggu ini'),
          _buildPetugasItem('Dr. Ahmad', 'Dokter', '2 shift minggu ini'),
          _buildPetugasItem('Dr. Lisa', 'Dokter', '1 shift minggu ini'),
          _buildPetugasItem('Ns. Budi', 'Perawat', '2 shift minggu ini'),
          _buildPetugasItem('Ns. Sari', 'Perawat', '1 shift minggu ini'),
        ],
      ),
    );
  }

  Widget _buildPetugasItem(String nama, String posisi, String jadwal) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Color(0xFF14482F),
            child: Text(
              nama.substring(0, 2),
              style: TextStyle(
                color: Color(0xFF14482F),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nama, style: const TextStyle(fontWeight: FontWeight.w600)),
                Text(
                  '$posisi • $jadwal',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
