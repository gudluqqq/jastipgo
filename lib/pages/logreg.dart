// ignore_for_file: library_private_types_in_public_api, deprecated_member_use, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:jastipgo/auth/auth_services.dart';
import 'package:jastipgo/database/user.dart';
import 'package:jastipgo/database/user_database.dart';
import 'package:jastipgo/widget/appbackground1.dart';
import 'package:jastipgo/pages/profile_page.dart';

class LogRegPage extends StatefulWidget {
  const LogRegPage({super.key});

  @override
  _LogRegPageState createState() => _LogRegPageState();
}

class _LogRegPageState extends State<LogRegPage> {
  bool isLogin = true;
  bool _obscureText = true; // Inisialisasi dengan true
  bool _obscureConfirmText = true; // Inisialisasi dengan true
  final authService = AuthService();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _usernameController = TextEditingController();

  void login() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    try {
      await authService.signInWithEmailPassword(email, password);
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Error: $e")));
      }
    }
  }

  void signUp() async {
    final email = _emailController.text;
    final username = _usernameController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (password != confirmPassword) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Password tidak sesuai")));
      return;
    }
    try {
      await authService.signUpWithEmailPassword(email, password, username);
      final newUser = UserLogin(
        nama: _usernameController.text,
        email: _emailController.text,
      );
      await UserLoginDatabase().createUser(newUser);
      if (mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Error: $e")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Appbackground1(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 50,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 190),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isLogin ? 'Masuk ke Akun Anda' : 'Buat Akun Baru',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                isLogin = !isLogin;
                              });
                            },
                            child: Text(
                              isLogin
                                  ? "Belum punya akun? Register"
                                  : "Sudah punya akun? Login",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 80),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 30,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(
                            255,
                            167,
                            34,
                            34,
                          ).withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (!isLogin) ...[
                              TextField(
                                controller: _usernameController,
                                decoration: InputDecoration(
                                  labelText: 'Username',
                                  labelStyle: TextStyle(color: Colors.white),
                                  filled: true,
                                  fillColor: const Color.fromARGB(
                                    255,
                                    167,
                                    34,
                                    34,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 10),
                            ],
                            TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: TextStyle(color: Colors.white),
                                filled: true,
                                fillColor: const Color.fromARGB(
                                  255,
                                  167,
                                  34,
                                  34,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(color: Colors.white),
                                filled: true,
                                fillColor: const Color.fromARGB(
                                  255,
                                  167,
                                  34,
                                  34,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                ),
                              ),
                              obscureText: _obscureText,
                              style: TextStyle(color: Colors.white),
                            ),
                            if (!isLogin) ...[
                              SizedBox(height: 10),
                              TextField(
                                controller: _confirmPasswordController,
                                decoration: InputDecoration(
                                  labelText: 'Confirm Password',
                                  labelStyle: TextStyle(color: Colors.white),
                                  filled: true,
                                  fillColor: const Color.fromARGB(
                                    255,
                                    167,
                                    34,
                                    34,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscureConfirmText
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscureConfirmText =
                                            !_obscureConfirmText;
                                      });
                                    },
                                  ),
                                ),
                                obscureText: _obscureConfirmText,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                            SizedBox(height: 20),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  isLogin ? login() : signUp();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(
                                    255,
                                    167,
                                    34,
                                    34,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 100,
                                    vertical: 15,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  isLogin ? 'Login' : 'Register',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
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
          },
        ),
      ),
    );
  }
}
