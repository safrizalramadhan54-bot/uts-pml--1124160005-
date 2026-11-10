import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilPage(),
    );
  }
}

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('profil saya'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundColor: Colors.white,
                child: Icon(Icons.person,size: 60,color: Colors.blue),
              ),
              const SizedBox(height: 16),
              const Text(
                'Safrizal Ramadhan',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
              ),
              const Text(
                'Teknik Informatika (1124160005)',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
              ),              
            ],
          ),
        ),
      ),
    );
  }
}

