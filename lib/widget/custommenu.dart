import 'package:flutter/material.dart';

class CustomMenu extends StatelessWidget {
  final Function(String) onMenuItemSelected;

  const CustomMenu({Key? key, required this.onMenuItemSelected})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 5,
      borderRadius: BorderRadius.circular(0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 300,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildMenuItem(
              context,
              icon: Icons.motorcycle,
              text: "Anjemmn",
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

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 3,
        height: double.infinity,
        color: Colors.blueGrey[50],
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
