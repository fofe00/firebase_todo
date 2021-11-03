import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_todo/models/user.dart' as U;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user based on firebase user
  U.User? _userFromFirebase(UserCredential userCredential){
    User? user = _auth.currentUser;
    // ignore: unnecessary_null_comparison
    return userCredential != null ? U.User(uid: user!.uid):null;
  }
   // auth user  change stream
  Stream<User?>get user{
    return _auth.authStateChanges();
  }

// register function 
  Future registerEmailAndPwd(String email,String password)async{
    try {
      UserCredential result=await _auth.createUserWithEmailAndPassword(email: email, password: password);

      //create doc for user
      //dynamic uid= result.user!.uid;
      //await DatabaseService(uid: uid).updateData('0', "new member", 100);
      //await 
      return _userFromFirebase(result);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  // login function 
   Future loginEmailAndPwd(String email,String password)async{
    try {
      UserCredential result=await _auth.signInWithEmailAndPassword(email: email, password: password);
      return _userFromFirebase(result);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //log out function 
  Future logout()async{
    return await _auth.signOut();
  }
}
