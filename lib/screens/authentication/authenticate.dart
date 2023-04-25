import 'package:flutter/material.dart';
import 'package:newappdemo/screens/authentication/register.dart';
import 'package:newappdemo/screens/authentication/singn_in.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  //methode for swithch bethween the signin and register
  bool signInPage = true;

  void swicthPages() {
    setState(() {
      signInPage = !signInPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (signInPage == true) {
      return SignIn(toggleScreens: swicthPages);
    } else {
      return Register(toggleScreens: swicthPages);
    }
  }
}
