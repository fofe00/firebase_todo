import 'package:firebase_todo/services/auth.dart';
import 'package:firebase_todo/shared/constants.dart';
import 'package:firebase_todo/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({Key? key, required this.toggleView}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String _email = "";
  String _pwd = "";
  String error = "";
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
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
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration:
                          textInputdecoration.copyWith(hintText: "Email"),
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
                      obscureText: true,
                      decoration:
                          textInputdecoration.copyWith(hintText: "Password"),
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
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          dynamic result =
                              await _auth.registerEmailAndPwd(_email, _pwd);
                          if (result == null) {
                            setState(() {
                              error = "please supply a valid email";
                              loading = false;
                            });
                          }
                        }
                      },
                      child: Text('Register'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
