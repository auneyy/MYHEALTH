import 'package:flutter/material.dart';
import 'package:myhealth/cari_petugas.dart';
import 'package:myhealth/chat_page.dart';
import 'package:myhealth/daftar.dart';
import 'package:myhealth/home.dart';
import 'package:myhealth/masuk.dart';
import 'package:myhealth/welcome_screen.dart';
import 'package:myhealth/dokter_ai.dart';
import 'splash_screen.dart';
import 'package:myhealth/mat_uks.dart';
import 'jadwal_uks.dart';
import 'profil.dart';
import 'obat.dart';
import 'riwayat.dart';
import 'notifikasi.dart';
import 'settings.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyHealth',
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/Welcome': (context) => const WelcomeScreen(),
        '/Masuk': (context) => const Masuk(),
        '/Daftar': (context) => const Daftar(),
        '/home': (context) => const Home(),
        '/petugas': (context) => const CariPetugas(),
        '/dokterAI': (context) => const DokterAIPage(),
        '/uks': (context) => const UKSPage(),
        '/jadwal': (context) => const JadwalPetugasUKS(),
        '/profil': (context) => const ProfilPage(),
        '/obat': (context) => const PengambilanObatPage(),
        '/riwayat': (context) => RiwayatPage(),
        '/notifications': (context) => NotifikasiSettingsPage(),
        '/settings': (context) => SettingsPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/chat') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => ChatPage(
              namaPetugas: args['namaPetugas'],
            ),
          );
        }
        return null;
      },
    );
  }
}
