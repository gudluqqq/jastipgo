// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:jastipgo/pages/logreg.dart';
import 'package:jastipgo/auth/auth_services.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final currentEmail = authService.getCurrentUserEmail();

    return WillPopScope(
      // Mencegah tombol back di Android
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          automaticallyImplyLeading: false, // Hilangkan tombol back di AppBar
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(currentEmail.toString()),
              ElevatedButton(
                onPressed: () {
                  // Navigasi ke LoginPage & hapus semua halaman sebelumnya
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LogRegPage()),
                    (Route<dynamic> route) =>
                        false, // Hapus semua halaman sebelumnya
                  );
                },
                child: Text('Sign Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
