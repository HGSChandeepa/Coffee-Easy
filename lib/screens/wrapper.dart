import 'package:flutter/material.dart';
import 'package:newappdemo/screens/authentication/authenticate.dart';
import 'package:newappdemo/screens/home/home.dart';

//this is the layer that pass the users in to the correctthis can be bthe auth page or the home page
class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    //return either home or auth
    return Authenticate();
  }
}
