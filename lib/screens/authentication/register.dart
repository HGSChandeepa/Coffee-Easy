import 'package:flutter/material.dart';
import 'package:newappdemo/screens/authentication/singn_in.dart';
import 'package:newappdemo/services/auth.dart';
import 'package:newappdemo/screens/authentication/authenticate.dart';

class Register extends StatefulWidget {
  final Function toggleScreens;
  Register({required this.toggleScreens});

  @override
  State<Register> createState() => _SignInState();
}

class _SignInState extends State<Register> {
  //functions

  //here we are geting that insance and interacting with the authentication

  final AuthService _auth = AuthService();
  //text feilds
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        elevation: 0,
        title: const Text("Register Please"),
        actions: [
          FilledButton.icon(
            onPressed: () {
              widget.toggleScreens();
            },
            icon: const Icon(Icons.login),
            label: const Text("Sign in"),
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                Colors.green[400],
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 50,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //singn in form email and password
              Form(
                  child: Column(
                children: [
                  const SizedBox(height: 20),
                  //email form
                  TextFormField(
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                  ),

                  const SizedBox(height: 20),
                  //PASSWORD
                  TextFormField(
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),

                  ElevatedButton(
                    //sign in methode
                    onPressed: () async {
                      print(email);
                      print(password);
                    },
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green),
                    ),
                    child: const Text("Register"),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
