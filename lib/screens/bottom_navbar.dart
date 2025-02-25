import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'profiles.dart';
import 'calculate.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final user = FirebaseAuth.instance.currentUser;

  signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  final List<Widget> _pages = [
    const Profiles(),
    const CalculatePage(),
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      signOut();
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFFFFF9EF),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFFFF9EF),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profiles',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
      ),
    ));
  }
}
