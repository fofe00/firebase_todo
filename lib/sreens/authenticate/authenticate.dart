import 'package:firebase_todo/sreens/authenticate/login.dart';
import 'package:firebase_todo/sreens/authenticate/register.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({ Key? key }) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn=true;
  void toggleView(){
    setState(() {
      showSignIn=!showSignIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    return showSignIn? Login(toggleView:toggleView):Register(toggleView:toggleView);
  }
}