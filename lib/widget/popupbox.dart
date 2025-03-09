import 'package:flutter/material.dart';

class CustomPopupBox extends StatelessWidget {
  final Function(String) onMenuItemSelected;

  const CustomPopupBox({Key? key, required this.onMenuItemSelected})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 5,
      borderRadius: BorderRadius.circular(0), // Tidak ada border-radius
      child: Container(
        width:
            MediaQuery.of(context).size.width, // Menggunakan lebar layar penuh
        height: 300, // Ukuran kotak lebih besar
        color: Colors.white, // Warna kotak putih
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceEvenly, // Membagi ruang secara merata
          children: [
            _buildMenuItem(
              context,
              icon: Icons.motorcycle,
              text: "Anjem",
              onTap: () => onMenuItemSelected('Anjem'),
            ),
            _buildMenuItem(
              context,
              icon: Icons.shopping_cart,
              text: "Jastip",
              onTap: () => onMenuItemSelected('Jastip'),
            ),
            _buildMenuItem(
              context,
              icon: Icons.language,
              text: "Komunitas",
              onTap: () => onMenuItemSelected('Komunitas'),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk membuat kotak dengan ikon dan teks, tambahkan parameter context
  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width:
            MediaQuery.of(context).size.width /
            3, // Setiap kotak lebar sepertiga layar
        height: double.infinity, // Kotak akan mengisi tinggi penuh
        color: Colors.blueGrey[50], // Warna kotak
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.black),
            SizedBox(height: 8),
            Text(text, style: TextStyle(fontSize: 16, color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
