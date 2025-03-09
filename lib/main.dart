import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:jastipgo/widget/appbackground.dart';
import 'package:jastipgo/pages/intropage.dart';

void main()  async{
 
  await Supabase.initialize(
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNudHBwb3Z3YWFkbXhxa3BlbmZwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDExNjcxMzAsImV4cCI6MjA1Njc0MzEzMH0.yz_wSszQw53oa0OXSACjtQQ8pb8lCy9tjg8kh-jhv6M",
    url: "https://sntppovwaadmxqkpenfp.supabase.co",
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}) ;

  @override
    Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Appbackground(
        child: Intropage(),
      ),
    );
  }
}