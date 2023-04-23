import 'package:flutter/material.dart';
import 'package:newappdemo/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleScreens;
  SignIn({required this.toggleScreens});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
        title: const Text("Sign In Please"),
        actions: [
          FilledButton.icon(
            onPressed: () {
              widget.toggleScreens();
            },
            icon: const Icon(Icons.app_registration),
            label: const Text("Register"),
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
              ElevatedButton(
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
                  backgroundColor: MaterialStatePropertyAll(Colors.purple),
                ),
                child: const Text("Press to Sign in as anonymus"),
              ),

              //singn in form email and password
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      //email form
                      TextFormField(
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
                          if (_formKey.currentState!.validate()) {
                            //if the user do not provides a valid email
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error =
                                    "Could not signin with those credentials";
                              });
                            }
                          }
                        },
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green),
                        ),
                        child: const Text("Sign in"),
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
