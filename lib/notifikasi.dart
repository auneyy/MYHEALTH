import 'package:flutter/material.dart';

class NotifikasiSettingsPage extends StatefulWidget {
  @override
  _NotifikasiSettingsPageState createState() => _NotifikasiSettingsPageState();
}

class _NotifikasiSettingsPageState extends State<NotifikasiSettingsPage> {
  bool kunjunganBaru = true;
  bool reminderObat = false;
  bool statusUpdate = true;
  bool jadwalKontrol = false;
  bool emergencyAlert = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 223, 223),
      appBar: AppBar(
        title: Text(
          'Pengaturan Notifikasi',
          style: TextStyle(color: Color(0xFF14482F), fontWeight: FontWeight.w600, fontSize: 16, fontFamily: 'Poppins'),
        ),
        shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Container(
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
            child: Column(
              children: [
                _buildNotificationTile(
                  icon: Icons.person_add,
                  title: 'Kunjungan Baru',
                  subtitle: 'Notifikasi saat ada pasien baru',
                  value: kunjunganBaru,
                  onChanged: (value) {
                    setState(() {
                      kunjunganBaru = value;
                    });
                  },
                ),
                Divider(height: 1, color: Colors.grey[200]),
                _buildNotificationTile(
                  icon: Icons.medication,
                  title: 'Reminder Obat',
                  subtitle: 'Pengingat waktu minum obat',
                  value: reminderObat,
                  onChanged: (value) {
                    setState(() {
                      reminderObat = value;
                    });
                  },
                ),
                Divider(height: 1, color: Colors.grey[200]),
                _buildNotificationTile(
                  icon: Icons.update,
                  title: 'Update Status',
                  subtitle: 'Pemberitahuan perubahan status pasien',
                  value: statusUpdate,
                  onChanged: (value) {
                    setState(() {
                      statusUpdate = value;
                    });
                  },
                ),
                Divider(height: 1, color: Colors.grey[200]),
                _buildNotificationTile(
                  icon: Icons.schedule,
                  title: 'Jadwal Kontrol',
                  subtitle: 'Reminder jadwal kontrol pasien',
                  value: jadwalKontrol,
                  onChanged: (value) {
                    setState(() {
                      jadwalKontrol = value;
                    });
                  },
                ),
                Divider(height: 1, color: Colors.grey[200]),
                _buildNotificationTile(
                  icon: Icons.warning,
                  title: 'Emergency Alert',
                  subtitle: 'Notifikasi darurat dan prioritas tinggi',
                  value: emergencyAlert,
                  onChanged: (value) {
                    setState(() {
                      emergencyAlert = value;
                    });
                  },
                  isLast: true,
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                _showSaveDialog();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF14482F),
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
              ),
              child: Text(
                'Simpan Pengaturan',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
    bool isLast = false,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFF14482F).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: Color(0xFF14482F),
              size: 20,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Color(0xFF14482F),
            activeTrackColor: Color(0xFF14482F).withOpacity(0.3),
          ),
        ],
      ),
    );
  }

  void _showSaveDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(
            'Pengaturan Tersimpan',
            style: TextStyle(
              color: Color(0xFF14482F),
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text('Pengaturan notifikasi berhasil disimpan.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style: TextStyle(color: Color(0xFF14482F)),
              ),
            ),
          ],
        );
      },
    );
  }
}