import 'package:firebase_auth/firebase_auth.dart';
import 'package:newappdemo/models/userdata.dart';
import 'package:newappdemo/services/database.dart';

class AuthService {
  //firebase instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj base on FirebaseUser (User)
  UserData? _userFromFirebaseUser(User? user) {
    return user != null ? UserData(uid: user.uid) : null;
  }

  //create the stream for checking the auth changes in the user
  Stream<UserData?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //signin annon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }

  //register email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      //create a new document in the database for the new user with the user id
      await DatabaseService(uid: user!.uid)
          .updateUserData("0", "new crew member", 100);

      return _userFromFirebaseUser(user);
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }

  //sigin in email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }
}
