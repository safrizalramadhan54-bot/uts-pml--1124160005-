import 'package:flutter/material.dart';

import '../models/profile.dart';
import '../widgets/info_tile.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  final bool isDark;
  final ValueChanged<bool> onThemeChanged;

  const ProfilePage({
    super.key,
    required this.isDark,
    required this.onThemeChanged,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Profile _profile = Profile.awal;

  Future<void> _editProfile() async {
    final hasil = await Navigator.push<Profile>(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfilePage(profile: _profile),
      ),
    );

    if (hasil != null) {
      setState(() => _profile = hasil);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profil berhasil diperbarui')),
      );
    }
  }

  void _logout() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya'),
        actions: [
          IconButton(
            tooltip: widget.isDark ? 'Mode terang' : 'Mode gelap',
            icon: Icon(widget.isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => widget.onThemeChanged(!widget.isDark),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(_profile.nama),
              accountEmail: Text(_profile.email),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/foto.jpg'),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Tentang Saya'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
            SwitchListTile(
              secondary: const Icon(Icons.dark_mode),
              title: const Text('Mode Gelap'),
              value: widget.isDark,
              onChanged: widget.onThemeChanged,
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: _logout,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _editProfile,
        icon: const Icon(Icons.edit),
        label: const Text('Edit Profil'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 8),
          Center(
            child: CircleAvatar(
              radius: 64,
              backgroundColor: scheme.primaryContainer,
              backgroundImage: const AssetImage('assets/images/foto.jpg'),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            _profile.nama,
            textAlign: TextAlign.center,
            style: textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'NIM ${_profile.nim}',
            textAlign: TextAlign.center,
            style: textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Bio', style: textTheme.titleSmall),
                  const SizedBox(height: 6),
                  Text(_profile.bio),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          InfoTile(
            icon: Icons.school,
            title: 'Program Studi',
            value: _profile.prodi,
          ),
          InfoTile(
            icon: Icons.class_,
            title: 'Kelas',
            value: _profile.kelas,
          ),
          const SizedBox(height: 12),
          Text('Kontak', style: textTheme.titleMedium),
          const SizedBox(height: 4),
          InfoTile(
            icon: Icons.email,
            title: 'Email',
            value: _profile.email,
          ),
          InfoTile(
            icon: Icons.phone,
            title: 'Nomor HP',
            value: _profile.hp,
          ),
          InfoTile(
            icon: Icons.code,
            title: 'GitHub',
            value: _profile.github,
          ),
          const SizedBox(height: 80), 
        ],
      ),
    );
  }
}