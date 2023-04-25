import 'package:flutter/material.dart';
import 'package:newappdemo/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleScreens;
  const Register({super.key, required this.toggleScreens});

  @override
  State<Register> createState() => _SignInState();
}

class _SignInState extends State<Register> {
  //functions

  //here we are geting that insance and interacting with the authentication

  final AuthService _auth = AuthService();
  //form key is used to check the form is valid or not
  final _formKey = GlobalKey<FormState>();
  //text feilds
  String email = "";
  String password = "";
  String error = "";
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
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      //email form
                      TextFormField(
                        //here the val can be null so  the validator must tell that so val?.lenght is used
                        validator: (val) =>
                            val?.isEmpty == true ? "Enter a valid email" : null,
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                      ),

                      const SizedBox(height: 20),
                      //PASSWORD
                      TextFormField(
                        //here the val cant be null so  the validator must tell that so val!.lenght is used
                        validator: (val) =>
                            val!.length < 6 ? "Enter a valid password" : null,
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
                          //checck the user entered values are valid
                          if (_formKey.currentState!.validate()) {
                            dynamic result = await _auth
                                .registerWithEmailAndPassword(email, password);

                            //if the user do not provides a valid email
                            if (result == null) {
                              setState(() {
                                error = "plesase enter a valid email !";
                              });
                            }
                          }
                        },
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green),
                        ),
                        child: const Text("Register"),
                      ),
                      const SizedBox(height: 20),
                      //erroe text
                      Text(
                        error,
                        style: const TextStyle(color: Colors.red),
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
