class Profile {
  final String nama;
  final String nim;
  final String prodi;
  final String kelas;
  final String bio;
  final String email;
  final String hp;
  final String github;

  const Profile({
    required this.nama,
    required this.nim,
    required this.prodi,
    required this.kelas,
    required this.bio,
    required this.email,
    required this.hp,
    required this.github,
  });

  static const Profile awal = Profile(
    nama: 'Safrizal Ramadhan',
    nim: '1124160005',
    prodi: 'Sistem Informasi',
    kelas: '07TPLE001',
    bio: 'Mahasiswa dan solo developer yang suka membangun aplikasi '
        'web, desktop, dan mobile.',
    email: 'safrizalramadhan54@gmail.com',
    hp: '081234567890',
    github: 'safrizalramadhan54-bot',
  );

  Profile copyWith({
    String? nama,
    String? nim,
    String? prodi,
    String? kelas,
    String? bio,
    String? email,
    String? hp,
    String? github,
  }) {
    return Profile(
      nama: nama ?? this.nama,
      nim: nim ?? this.nim,
      prodi: prodi ?? this.prodi,
      kelas: kelas ?? this.kelas,
      bio: bio ?? this.bio,
      email: email ?? this.email,
      hp: hp ?? this.hp,
      github: github ?? this.github,
    );
  }
}
