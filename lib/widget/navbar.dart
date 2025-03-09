import 'package:flutter/material.dart';

class CustomNavbar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onNavItemTapped;
  final VoidCallback onAddPressed;

  const CustomNavbar({
    super.key,
    required this.selectedIndex,
    required this.onNavItemTapped,
    required this.onAddPressed,
  });

  @override
  _CustomNavbarState createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  bool _isFabOpen = false;

  void _toggleFab() {
    setState(() {
      _isFabOpen = !_isFabOpen;
    });
    widget.onAddPressed();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Color(0xFFC64F38),
          notchMargin: 6.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, "Home", 0),
              SizedBox(width: 40), // Ruang untuk FAB
              _buildNavItem(Icons.receipt, "Bill", 1),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          child: FloatingActionButton(
            onPressed: _toggleFab,
            backgroundColor: Color(0xFFC64F38),
            child: Icon(
              _isFabOpen ? Icons.close : Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(IconData icon, String text, int index) {
    bool isActive = widget.selectedIndex == index;
    return GestureDetector(
      onTap: () {
        widget.onNavItemTapped(index);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: isActive ? Colors.black38 : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 30),
            AnimatedOpacity(
              duration: Duration(milliseconds: 300),
              opacity: isActive ? 1.0 : 0.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
