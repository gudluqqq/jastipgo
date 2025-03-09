import 'package:flutter/material.dart';
import 'package:jastipgo/widget/custommenu.dart'; // Import CustomMenu
import 'profile_page.dart';
import 'package:jastipgo/widget/navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  double _avatarSize = 60;
  double _opacity = 1.0;
  double _slideValue = 0.0;
  int _selectedIndex = 0;
  bool _isFabOpen = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.hasClients) {
        setState(() {
          double offset = _scrollController.offset;
          _avatarSize = (60 - (offset / 3)).clamp(0, 60);
          _opacity = (1 - (offset / 100)).clamp(0, 1);
          _slideValue = (-offset / 100).clamp(-1, 0);
        });
      }
    });
  }

  void _toggleFab() {
    setState(() {
      _isFabOpen = !_isFabOpen;
    });
  }

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Color(0xFFC64F38),
          ),
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.18),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFAA3F30),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "Scrollable Content",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(height: 1000),
                    ],
                  ),
                ),
              ],
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            top: 50,
            left: 20,
            right: 20,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 200),
              opacity: _opacity,
              child: AnimatedSlide(
                duration: Duration(milliseconds: 200),
                offset: Offset(0, _slideValue),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Halo User",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Selamat datang di JastipGo",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_opacity > 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfilePage(),
                            ),
                          );
                        }
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        width: _avatarSize,
                        height: _avatarSize,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.person,
                          color: Color(0xFFC64F38),
                          size: _avatarSize * 0.6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (_isFabOpen)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CustomMenu(
                onMenuItemSelected: (item) {
                  print("Selected: $item");
                },
              ),
            ),
        ],
      ),
      bottomNavigationBar: CustomNavbar(
        selectedIndex: _selectedIndex,
        onNavItemTapped: _onNavItemTapped,
        onAddPressed: _toggleFab,
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: HomePage(), debugShowCheckedModeBanner: false));
}
