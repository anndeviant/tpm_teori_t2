import 'package:flutter/material.dart';
//import 'package:tpm_teori_t2/regist.dart';
// import 'package:tpm_teori_t2/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tpm_teori_t2/wrapper.dart';
//import 'package:tpm_teori_t2/screens/bottom_navbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: Wrapper(),
      //home: const MainScreen(),
    );
  }
}
