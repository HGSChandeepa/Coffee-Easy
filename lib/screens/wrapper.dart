import 'package:flutter/material.dart';
import 'package:newappdemo/models/userdata.dart';
import 'package:newappdemo/screens/authentication/authenticate.dart';
import 'package:newappdemo/screens/home/home.dart';
import 'package:provider/provider.dart';

//this is the layer that pass the users in to the correctthis can be bthe auth page or the home page
class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    //the user data that the provider proides this can be a user data or can be null.
    final user = Provider.of<UserData?>(context);
    // ignore: avoid_print
    print(user);
    //return either home or auth
    if (user == null) {
      return const Authenticate();
    } else {
      return Home();
    }
  }
}
