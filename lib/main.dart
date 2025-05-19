import 'package:flutter/material.dart';
import 'package:myhealth/cari_petugas.dart';
import 'package:myhealth/chat_page.dart';
import 'package:myhealth/daftar.dart';
import 'package:myhealth/home.dart';
import 'package:myhealth/masuk.dart';
import 'package:myhealth/welcome_screen.dart';
import 'splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/Welcome': (context) => const WelcomeScreen(),
        '/Masuk': (context) => const Masuk(),
        '/Daftar': (context) => const Daftar(),
        '/Home': (context) => const Home(),
        '/petugas': (context) => const CariPetugas(),
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
