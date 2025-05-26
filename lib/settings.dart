import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Pengaturan',
          style: TextStyle(color: Color(0xFF14482F), fontWeight: FontWeight.w600),
        ),
        shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
        backgroundColor: Color.fromARGB(255, 239, 239, 239),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Profile Section
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
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFF14482F).withOpacity(0.1),
                    child: Icon(
                      Icons.person,
                      size: 35,
                      color: Color(0xFF14482F),
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Auni Hamizan',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF14482F),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Orang Tertampan di Dunia',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          SizedBox(height: 20),
          
          // Settings Options
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
                _buildSettingsTile(
                  icon: Icons.notifications,
                  title: 'Notifikasi',
                  subtitle: 'Atur pengaturan notifikasi',
                  onTap: () {
                    Navigator.pushNamed(context, '/notifications');
                  },
                ),
                Divider(height: 1, color: Colors.grey[200]),
                _buildSettingsTile(
                  icon: Icons.lock,
                  title: 'Keamanan',
                  subtitle: 'Password dan keamanan akun',
                  onTap: () {
                    // Navigate to security settings
                  },
                ),
                Divider(height: 1, color: Colors.grey[200]),
                _buildSettingsTile(
                  icon: Icons.language,
                  title: 'Bahasa',
                  subtitle: 'Indonesia',
                  onTap: () {
                    _showLanguageDialog();
                  },
                ),
                Divider(height: 1, color: Colors.grey[200]),
                _buildSettingsTile(
                  icon: Icons.backup,
                  title: 'Backup Data',
                  subtitle: 'Backup otomatis data pasien',
                  onTap: () {
                    _showBackupDialog();
                  },
                  isLast: true,
                ),
              ],
            ),
          ),
          
          SizedBox(height: 20),
          
          // About Section
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
                _buildSettingsTile(
                  icon: Icons.help,
                  title: 'Bantuan',
                  subtitle: 'FAQ dan panduan penggunaan',
                  onTap: () {
                    // Navigate to help
                  },
                ),
                Divider(height: 1, color: Colors.grey[200]),
                _buildSettingsTile(
                  icon: Icons.info,
                  title: 'Tentang Aplikasi',
                  subtitle: 'Versi 1.0.0',
                  onTap: () {
                    _showAboutDialog();
                  },
                  isLast: true,
                ),
              ],
            ),
          ),
          
          SizedBox(height: 30),
          
          // Logout Button
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                _showLogoutDialog();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
              ),
              child: Text(
                'Keluar',
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

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    bool isLast = false,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
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
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }

  void _showLanguageDialog() {
    // Language selection dialog
  }

  void _showBackupDialog() {
    // Backup confirmation dialog
  }

  void _showAboutDialog() {
    // About app dialog
  }

  void _showLogoutDialog() {
    // Logout confirmation dialog
  }
}