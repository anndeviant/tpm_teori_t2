import 'package:flutter/material.dart';
import 'package:tpm_teori_t2/login.dart';
//import 'package:tpm_teori_t2/screens/bottom_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Login(),
      //home: const MainScreen(),
    );
  }
}
