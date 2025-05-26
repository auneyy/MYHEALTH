import 'package:flutter/material.dart';
import 'package:myhealth/custom_bottom_navbar.dart';

class RiwayatPage extends StatelessWidget {
  const RiwayatPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 227, 227),
      resizeToAvoidBottomInset: false,
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
        title: Text(
          'Riwayat Kunjungan',
          style: TextStyle(color: Color(0xFF14482F), fontWeight: FontWeight.w600),
        ),
        shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
        backgroundColor: Color.fromARGB(255, 251, 251, 251),
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
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _getNama(index),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF14482F),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: _getStatusColor(index),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          _getStatus(index),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.calendar_today, size: 14, color: Colors.grey[600]),
                      SizedBox(width: 6),
                      Text(
                        _getTanggal(index),
                        style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                      ),
                      SizedBox(width: 16),
                      Icon(Icons.access_time, size: 14, color: Colors.grey[600]),
                      SizedBox(width: 6),
                      Text(
                        _getWaktu(index),
                        style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Keluhan: ${_getKeluhan(index)}',
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Tindakan: ${_getTindakan(index)}',
                    style: TextStyle(fontSize: 14, color: Color(0xFF14482F)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String _getNama(int index) {
    List<String> names = [
      'Rafi Iqbal',
      'Irfan Wazowski', 
      'Eval Siswanto',
      'Ridho Bom',
      'Gema Nerd'
    ];
    return names[index];
  }

  String _getTanggal(int index) {
    List<String> dates = [
      '22 Mei 2025',
      '21 Mei 2025',
      '20 Mei 2025', 
      '19 Mei 2025',
      '18 Mei 2025'
    ];
    return dates[index];
  }

  String _getWaktu(int index) {
    List<String> times = [
      '08:30',
      '10:15',
      '13:45',
      '09:20', 
      '14:30'
    ];
    return times[index];
  }

  String _getKeluhan(int index) {
    List<String> complaints = [
      'ChatGPT Limit',
      'Kaki Putus',
      'Tertusuk Panah Cinta',
      'Terpeleset di Tangga',
      'Alat kelamin sakit'
    ];
    return complaints[index];
  }

  String _getTindakan(int index) {
    List<String> actions = [
      'Berdoa Kepada Allah',
      'Pijat kretek ala Firman', 
      'Sadar diri',
      'Salto india',
      'Pemberian salep dan di potong'
    ];
    return actions[index];
  }

  String _getStatus(int index) {
    List<String> statuses = [
      'Selesai',
      'Selesai',
      'Selesai',
      'Rujukan',
      'Selesai'
    ];
    return statuses[index];
  }

  Color _getStatusColor(int index) {
    return _getStatus(index) == 'Selesai' 
        ? Color(0xFF14482F) 
        : Colors.orange;
  }
}