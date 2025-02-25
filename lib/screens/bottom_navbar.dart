import 'package:flutter/material.dart';
import 'profiles.dart';
import 'calculate.dart';
import 'package:tpm_teori_t2/login.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Profiles(),
    const CalculatePage(),
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      logOut();
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void logOut() async {
    bool response = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text('Logout'),
            ),
          ],
        );
      },
    );

    if (response == true) {
      if (!mounted) return;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Login()));
    } else {
      // Handle the case where the user cancels the logout
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
