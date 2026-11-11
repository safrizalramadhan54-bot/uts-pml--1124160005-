import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  static const List<String> _keahlian = [
    'Pengembangan web dengan Laravel',
    'Aplikasi desktop dengan Java Swing',
    'Aplikasi mobile dengan Flutter',
  ];

  static const List<String> _hobi = [
    'Ngoding proyek pribadi',
    'Belajar teknologi baru',
    'Bermain Futsal Dan Minisoccer',
    'Bermain Billiard',
  ];

  static const List<Map<String, String>> _pendidikan = [
    {
      'sekolah': 'Institut Teknologi & Bisnis Bina Sarana Global',
      'detail': 'Mahasiswa, 2024 - sekarang',
    },
    {
      'sekolah': 'SMKN 08 KOTA TANGERANG',
      'detail': '2021-2024',
    },
  ];

  Widget _judul(BuildContext context, String teks) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 4),
      child: Text(
        teks,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Saya')),
      body: ListView(
        children: [
          _judul(context, 'Keahlian'),
          for (final item in _keahlian)
            ListTile(
              leading: const Icon(Icons.check_circle),
              title: Text(item),
            ),
          _judul(context, 'Hobi'),
          for (final item in _hobi)
            ListTile(
              leading: const Icon(Icons.favorite),
              title: Text(item),
            ),
          _judul(context, 'Riwayat Pendidikan'),
          for (final item in _pendidikan)
            ListTile(
              leading: const Icon(Icons.school),
              title: Text(item['sekolah']!),
              subtitle: Text(item['detail']!),
            ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}