import 'package:flutter/material.dart';

import 'models/profile.dart';
import 'screens/about_page.dart';
import 'screens/login_page.dart';
import 'screens/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  // Data profil disimpan di sini supaya tidak hilang saat logout.
  Profile _profile = Profile.awal;

  bool get _isDark => _themeMode == ThemeMode.dark;

  void _setDark(bool value) {
    setState(() {
      _themeMode = value ? ThemeMode.dark : ThemeMode.light;
    });
  }

  void _updateProfile(Profile baru) {
    setState(() => _profile = baru);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Ical',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00796B),
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF26A69A),
          brightness: Brightness.dark,
        ),
      ),
      themeMode: _themeMode,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/profile': (context) => ProfilePage(
              profile: _profile,
              onProfileChanged: _updateProfile,
              isDark: _isDark,
              onThemeChanged: _setDark,
            ),
        '/about': (context) => const AboutPage(),
      },
    );
  }
}