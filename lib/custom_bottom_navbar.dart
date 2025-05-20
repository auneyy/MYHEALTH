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
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () => onTap(0),
                icon: Icon(Icons.home,
                    color: currentIndex == 0 ? Color(0xFF14482F) : Colors.grey),
              ),
              IconButton(
                onPressed: () => onTap(1),
                icon: Icon(Icons.calendar_today,
                    color: currentIndex == 1 ? Color(0xFF14482F) : Colors.grey),
              ),
              const SizedBox(width: 60), // ruang untuk tombol tengah
              IconButton(
                onPressed: () => onTap(3),
                icon: Icon(Icons.medication,
                    color: currentIndex == 3 ? Color(0xFF14482F) : Colors.grey),
              ),
              IconButton(
                onPressed: () => onTap(4),
                icon: Icon(Icons.receipt_long,
                    color: currentIndex == 4 ? Color(0xFF14482F) : Colors.grey),
              ),
            ],
          ),
        ),
        // Tombol Tengah Besar untuk Profil
        Positioned(
          top: -15,
          child: GestureDetector(
            onTap: () => onTap(2), // index 2 untuk halaman Profil
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
              child: const Icon(
                Icons.person,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
