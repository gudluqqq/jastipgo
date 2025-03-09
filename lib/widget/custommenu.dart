import 'package:flutter/material.dart';

class CustomMenu extends StatefulWidget {
  final Function(String) onMenuItemSelected;

  const CustomMenu({Key? key, required this.onMenuItemSelected})
    : super(key: key);

  @override
  _CustomMenuState createState() => _CustomMenuState();
}

class _CustomMenuState extends State<CustomMenu> {
  String _selectedItem = '';
  bool _isMenuVisible = false;
  bool _isTextVisible = true; // Teks akan selalu terlihat
  TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Menunggu sedikit agar menu muncul pertama kali
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _isMenuVisible = true;
      });
    });
  }

  void _onKirimPressed() {
    String inputText = _textController.text;

    if (_selectedItem.isEmpty) {
      // Menampilkan popup jika belum memilih ikon
      _showErrorDialog();
    } else {
      // Kirimkan teks yang diinput jika memilih ikon
      print('Teks yang dikirim: $inputText, Layanan: $_selectedItem');
    }
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Peringatan'),
          content: Text('Pilih Layanan terlebih dahulu'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 300),
      bottom:
          _isMenuVisible
              ? 60
              : -MediaQuery.of(context).size.height *
                  0.3, // Kotak muncul tepat di atas navbar
      left: 0,
      right: 0,
      child: AnimatedOpacity(
        opacity: _isMenuVisible ? 1.0 : 0.0,
        duration: Duration(milliseconds: 300),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width:
              MediaQuery.of(
                context,
              ).size.width, // Full lebar layar (perlebar container)
          height: 250, // Ukuran height menu diubah menjadi 250
          color: Color(
            0xFFAA3F30,
          ), // Ganti warna latar belakang menjadi #AA3F30
          child: Column(
            children: [
              // Border di atas dengan warna berbeda
              // Kotak latar untuk menu dengan ukuran lebih kecil
              Container(
                width: double.infinity,
                height: 70, // Ukuran kotak latar menu diperbesar
                decoration: BoxDecoration(
                  color: Color.fromARGB(
                    255,
                    255,
                    184,
                    78,
                  ), // Latar belakang menu
                ),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Menempatkan ikon di tengah
                  children: [
                    _buildMenuItem(Icons.motorcycle, "Anjem", 'Anjem'),
                    SizedBox(width: 30), // Jarak antar ikon lebih besar
                    _buildMenuItem(Icons.shopping_cart, "Jastip", 'Jastip'),
                    SizedBox(width: 30), // Jarak antar ikon lebih besar
                    _buildMenuItem(Icons.language, "Komunitas", 'Komunitas'),
                  ],
                ),
              ),
              SizedBox(height: 50),
              // Kontrol teks (ruang tengah di bawah ikon)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _textController,
                      style: TextStyle(
                        color: Colors.white,
                      ), // Warna teks inputan menjadi putih
                      decoration: InputDecoration(
                        hintText: 'Kontrol Teks...',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ), // Hint text putih dan bold
                        filled: true,
                        fillColor: Color(
                          0xFF84231F,
                        ), // Latar belakang kotak teks #84231F
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none, // Tidak ada border
                        ),
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Tombol kirim di tengah
                    Center(
                      child: ElevatedButton(
                        onPressed: _onKirimPressed, // Menambahkan logika kirim
                        child: Text(
                          "Kirim",
                          style: TextStyle(
                            color: Colors.white,
                          ), // Warna teks tombol "Kirim" diubah menjadi putih
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(
                            0xFF84231F,
                          ), // Tombol dengan warna yang sama dengan kotak teks
                          padding: EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String text, String id) {
    bool isSelected = _selectedItem == id;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItem = id; // Set item yang dipilih
        });
        widget.onMenuItemSelected(id);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ), // Memberikan jarak horizontal lebih besar
        decoration: BoxDecoration(
          color:
              isSelected
                  ? Color(0xFFAA3F30)
                  : Colors.transparent, // Background saat dipilih
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.center, // Menempatkan ikon di tengah
          children: [
            AnimatedScale(
              scale: isSelected ? 1.1 : 1.0, // Scale up untuk ikon yang dipilih
              duration: Duration(milliseconds: 300),
              child: Icon(
                icon,
                size: 30,
                color:
                    isSelected
                        ? Colors.white
                        : const Color.fromARGB(255, 138, 18, 18),
              ), // Ikon tetap putih
            ),
            SizedBox(width: 10), // Jarak antara ikon dan teks
            Text(
              text,
              style: TextStyle(
                fontSize: 14, // Ukuran font lebih kecil
                fontWeight: FontWeight.bold, // Membuat teks menjadi bold
                color:
                    isSelected
                        ? Colors.white
                        : const Color.fromARGB(
                          255,
                          160,
                          28,
                          28,
                        ), // Teks tetap putih
              ),
            ),
          ],
        ),
      ),
    );
  }
}
