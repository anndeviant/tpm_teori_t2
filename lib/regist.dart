import 'package:flutter/material.dart';
import 'package:tpm_teori_t2/login.dart';
import 'package:tpm_teori_t2/sqlite.dart';
import 'package:tpm_teori_t2/user.dart';

class Regist extends StatefulWidget {
  const Regist({super.key});

  @override
  State<Regist> createState() => _RegistState();
}

class _RegistState extends State<Regist> {
  final fullname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  final formKey = GlobalKey<FormState>();

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
    return Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Fullname', style: TextStyle(color: Color(0xFF03396C))),
            TextFormField(
              controller: fullname,
              validator: (value) {
                if (value!.isEmpty) {
                  return "fullname is required";
                }
                return null;
              },
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
                      )),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.red, // Sama dengan warna normal
                      width: 1,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.red, // Sama dengan warna fokus
                      width: 2,
                    ),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Email Address', style: TextStyle(color: Color(0xFF03396C))),
            TextFormField(
              controller: email,
              validator: (value) {
                if (value!.isEmpty) {
                  return "email is required";
                }
                return null;
              },
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
                      )),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.red, // Sama dengan warna normal
                      width: 1,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.red, // Sama dengan warna fokus
                      width: 2,
                    ),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Password', style: TextStyle(color: Color(0xFF03396C))),
            TextFormField(
              controller: password,
              validator: (value) {
                if (value!.isEmpty) {
                  return "password is required";
                }
                return null;
              },
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
                      )),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.red, // Sama dengan warna normal
                      width: 1,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.red, // Sama dengan warna fokus
                      width: 2,
                    ),
                  )),
              obscureText: true,
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ));
  }

  _btn(context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
            backgroundColor: Color(0xFF005B96),
          ),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              //fungsi submit
              final db = DatabaseHelper();
              db
                  .regist(Users(
                      fullname: fullname.text,
                      email: email.text,
                      password: password.text))
                  .whenComplete(() {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              });
            }
          },
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
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login()));
                },
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
