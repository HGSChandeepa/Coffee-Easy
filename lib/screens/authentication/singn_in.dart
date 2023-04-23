import 'package:flutter/material.dart';
import 'package:newappdemo/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //functions

  //here we are geting that insance and interacting with the authentication

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        elevation: 0,
        title: const Text("Sign In Please"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 50,
        ),
        child: ElevatedButton(
          onPressed: () async {
            //we have to waite here
            //here this result can be Null if no user and a valid user if correclty done
            dynamic result = await _auth.signInAnon();
            if (result == Null) {
              print('error sign in');
            } else {
              print("signed in");
              print(result.uid);
            }
          },
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.green),
          ),
          child: const Text("Press to Sign in"),
        ),
      ),
    );
  }
}
