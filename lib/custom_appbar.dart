import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      elevation: 10,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      automaticallyImplyLeading: false,
      title: null, // kosongkan
      centerTitle: true, // meskipun kita pakai flexibleSpace
      flexibleSpace: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Title di tengah
            Center(
              child: Text(
                title.toUpperCase(),
                style: const TextStyle(
                  color: Color(0xFF14482F),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 1,
                ),
              ),
            ),

            // Icon kiri (Settings)
            Positioned(
              left: 8,
              child: IconButton(
                icon: const Icon(Icons.settings, color: Color(0xFF14482F)),
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                },
              ),
            ),

            // Icon kanan (Profile dan Notifikasi)
            Positioned(
              right: 0,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.notifications, color: Color(0xFF14482F)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/notifications');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
