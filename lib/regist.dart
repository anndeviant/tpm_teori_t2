import 'package:flutter/material.dart';

class Regist extends StatelessWidget {
  const Regist({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xFFFFF9EF),
            resizeToAvoidBottomInset: true,
            body: Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _header(context),
                    _inputfield(context),
                    _btn(context),
                  ],
                ),
              ),
            )));
  }

  _header(context) {
    return Column(
      children: [
        SizedBox(
          height: 60,
        ),
        Text(
          'Hello, Calculaters!',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Color(0xFF03396C)),
        ),
        SizedBox(
          height: 50,
        ),
        Image.asset(
          'assets/images/Group 3.png',
          scale: 2,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  _inputfield(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Fullname', style: TextStyle(color: Color(0xFF03396C))),
        TextField(
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Color(0xFF03396C),
                    width: 1,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Color(0xFF03396C),
                    width: 2,
                  ))),
        ),
        SizedBox(
          height: 20,
        ),
        Text('Email Address', style: TextStyle(color: Color(0xFF03396C))),
        TextField(
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Color(0xFF03396C),
                    width: 1,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Color(0xFF03396C),
                    width: 2,
                  ))),
        ),
        SizedBox(
          height: 20,
        ),
        Text('Password', style: TextStyle(color: Color(0xFF03396C))),
        TextField(
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Color(0xFF03396C),
                    width: 1,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Color(0xFF03396C),
                    width: 2,
                  ))),
          obscureText: true,
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }

  _btn(context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
            backgroundColor: Color(0xFF005B96),
          ),
          onPressed: () {},
          child: Text('REGISTER',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Already have account?'),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Login here!',
                  style: TextStyle(color: Colors.blue),
                ))
          ],
        )
      ],
    );
  }
}
