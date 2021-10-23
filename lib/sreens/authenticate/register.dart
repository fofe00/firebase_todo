import 'package:firebase_todo/shared/constants.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({Key? key, required this.toggleView}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _email = "";
  String _pwd = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        actions: [
          TextButton.icon(
            icon: Icon(
              Icons.person,
              color: Colors.black,
            ),
            label: Text(
              "login",
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
                child: Text('Register'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
