import 'package:flutter/material.dart';
import 'package:jastipgo/pages/logreg.dart';

class Intropage extends StatefulWidget {
  const Intropage({super.key});

  @override
  State<Intropage> createState() => _IntropageState();
}

class _IntropageState extends State<Intropage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 110), // Padding merata
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Welcome to',
              style: TextStyle(
                color: Color.fromARGB(255, 139, 56, 56),
                fontSize: 25,
                fontWeight: FontWeight.w500,
                height: 1.0, // Mengurangi spasi bawaan antar teks
              ),
            ),
            Text(
              'AnjastipGo',
              style: TextStyle(
                color: Color.fromARGB(255, 139, 56, 56),
                fontSize: 41,
                fontWeight: FontWeight.w700,
                height: 1.0, // Mengurangi spasi bawaan antar teks
              ),
            ),
            SizedBox(height: 10), // Memberikan sedikit jarak
            Text(
              'Pesan antar jemput dan jasa titip\ndalam satu aplikasi!',
              style: TextStyle(
                color: Color.fromARGB(255, 139, 56, 56),
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 55), // Jarak sebelum gambar

            SizedBox(height: 20), // Jarak setelah gambar    
            
            Spacer(), // Mendorong tombol ke bawah
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogRegPage()), // Pindah ke LogRegPage
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 167, 34, 34),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 150, vertical: 8),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30), // Atur padding kiri dan kanan agar lebih rata
              child: Text(
                'By clicking, you will agree to AnjastipGo Terms and Conditions',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
