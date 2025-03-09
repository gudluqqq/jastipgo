import 'package:flutter/material.dart';

class Appbackground extends StatelessWidget {
  final Widget child; // Pastikan child dideklarasikan dengan benar

  const Appbackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("asset/Asset1.png"), // Path gambar
          fit: BoxFit.cover, // Menyesuaikan gambar dengan layar
        ),
      ),
      child: SafeArea(
        child: child, // Gunakan child di sini agar konten bisa ditampilkan
      ),
    );
  }
}
