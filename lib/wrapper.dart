import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_todo/sreens/authenticate/authenticate.dart';
import 'package:firebase_todo/sreens/home/home.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
   Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    print("########");
    print(user?.uid);
    print("########");
    print(user?.uid);
    print(user?.uid);
    print("########");
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
