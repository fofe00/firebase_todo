import 'package:firebase_todo/shared/constants.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final Function toggleView;
  Login({Key? key, required this.toggleView}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email = "";
  String _pwd = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        actions: [
          TextButton.icon(
            icon: Icon(
              Icons.person,
              color: Colors.black,
            ),
            label: Text(
              "register",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(left: 17, right: 17, top: 17),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: textInputdecoration.copyWith(hintText: "Email"),
                validator: (val) {
                  return val!.isEmpty ? "enter an email" : null;
                },
                onChanged: (val) {
                  setState(() {
                    _email = val;
                  });
                },
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: textInputdecoration.copyWith(hintText: "Password"),
                validator: (val) {
                  return val!.isEmpty ? "enter an password" : null;
                },
                onChanged: (val) {
                  setState(() {
                    _pwd = val;
                  });
                },
              ),
              SizedBox(
                height: 8,
              ),
              ElevatedButton(
                onPressed: () {
                  print("object");
                },
                child: Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
