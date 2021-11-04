import 'package:firebase_todo/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          IconButton(
              onPressed: () async {
                await _auth.logout();
              },
              icon: Icon(Icons.logout_outlined)),
        ],
      ),
    );
  }
}
