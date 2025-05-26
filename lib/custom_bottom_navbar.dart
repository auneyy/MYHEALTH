import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 80, // ⬅️ Ini penting agar Stack-nya bisa diberi ruang
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            // Background Bar
            Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      onTap(0);
                      Navigator.pushNamed(context, '/home');
                    },
                    icon: Icon(
                      Icons.home,
                      color: currentIndex == 0 ? const Color(0xFF14482F) : Colors.grey,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      onTap(1);
                      Navigator.pushNamed(context, '/jadwal');
                    },
                    icon: Icon(
                      Icons.calendar_today,
                      color: currentIndex == 1 ? const Color(0xFF14482F) : Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 60), // Spacer tombol tengah
                  IconButton(
                    onPressed: () {
                      onTap(3);
                      Navigator.pushNamed(context, '/obat');
                    },
                    icon: Icon(
                      Icons.medication,
                      color: currentIndex == 3 ? const Color(0xFF14482F) : Colors.grey,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      onTap(4);
                      Navigator.pushNamed(context, '/riwayat');
                    },
                    icon: Icon(
                      Icons.receipt_long,
                      color: currentIndex == 4 ? const Color(0xFF14482F) : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            // Tombol Tengah
            Positioned(
              top: -15,
              child: GestureDetector(
                onTap: () {
                  onTap(2);
                  Navigator.pushNamed(context, '/profil');
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF14482F),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.person, color: Colors.white, size: 30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
