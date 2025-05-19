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
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: const Color(0xFF14482F),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(fontFamily: 'Poppins'),
      unselectedLabelStyle: const TextStyle(fontFamily: 'Poppins'),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Jadwal',
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.person, color: Color(0xFF14482F)),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.medical_services),
          label: 'Screening',
        ),
      ],
    );
  }
}
