import 'package:flutter/material.dart';

import '../models/profile.dart';

class EditProfilePage extends StatefulWidget {
  final Profile profile;

  const EditProfilePage({super.key, required this.profile});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _namaC;
  late final TextEditingController _nimC;
  late final TextEditingController _prodiC;
  late final TextEditingController _kelasC;
  late final TextEditingController _bioC;
  late final TextEditingController _emailC;
  late final TextEditingController _hpC;
  late final TextEditingController _githubC;

  @override
  void initState() {
    super.initState();
    final p = widget.profile;
    _namaC = TextEditingController(text: p.nama);
    _nimC = TextEditingController(text: p.nim);
    _prodiC = TextEditingController(text: p.prodi);
    _kelasC = TextEditingController(text: p.kelas);
    _bioC = TextEditingController(text: p.bio);
    _emailC = TextEditingController(text: p.email);
    _hpC = TextEditingController(text: p.hp);
    _githubC = TextEditingController(text: p.github);
  }

  @override
  void dispose() {
    _namaC.dispose();
    _nimC.dispose();
    _prodiC.dispose();
    _kelasC.dispose();
    _bioC.dispose();
    _emailC.dispose();
    _hpC.dispose();
    _githubC.dispose();
    super.dispose();
  }

  void _simpan() {
    if (!_formKey.currentState!.validate()) return;

    final dataBaru = widget.profile.copyWith(
      nama: _namaC.text.trim(),
      nim: _nimC.text.trim(),
      prodi: _prodiC.text.trim(),
      kelas: _kelasC.text.trim(),
      bio: _bioC.text.trim(),
      email: _emailC.text.trim(),
      hp: _hpC.text.trim(),
      github: _githubC.text.trim(),
    );

    Navigator.pop(context, dataBaru);
  }

  Widget _field({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profil')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _field(
                controller: _namaC,
                label: 'Nama Lengkap',
                icon: Icons.person,
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return 'Nama wajib diisi';
                  }
                  return null;
                },
              ),
              _field(
                controller: _nimC,
                label: 'NIM',
                icon: Icons.badge,
                keyboardType: TextInputType.number,
              ),
              _field(
                controller: _prodiC,
                label: 'Program Studi',
                icon: Icons.school,
              ),
              _field(
                controller: _kelasC,
                label: 'Kelas',
                icon: Icons.class_,
              ),
              _field(
                controller: _bioC,
                label: 'Bio Singkat',
                icon: Icons.notes,
                maxLines: 3,
              ),
              _field(
                controller: _emailC,
                label: 'Email',
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                validator: (v) {
                  final value = v?.trim() ?? '';
                  if (value.isEmpty) return 'Email wajib diisi';
                  final regex = RegExp(r'^[\w.+-]+@[\w-]+(\.[\w-]+)+$');
                  if (!regex.hasMatch(value)) return 'Format email tidak valid';
                  return null;
                },
              ),
              _field(
                controller: _hpC,
                label: 'Nomor HP',
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
                validator: (v) {
                  final value = v?.trim() ?? '';
                  if (value.isEmpty) return 'Nomor HP wajib diisi';
                  if (!RegExp(r'^\d{10,13}$').hasMatch(value)) {
                    return 'Nomor HP hanya angka, 10-13 digit';
                  }
                  return null;
                },
              ),
              _field(
                controller: _githubC,
                label: 'Akun GitHub',
                icon: Icons.code,
              ),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: FilledButton.icon(
                  onPressed: _simpan,
                  icon: const Icon(Icons.save),
                  label: const Text('Simpan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}