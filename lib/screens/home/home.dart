import 'package:flutter/material.dart';
import 'package:newappdemo/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: const Text("Home Screen"),
        backgroundColor: Colors.green[400],
        elevation: 0,
        actions: [
          FilledButton.icon(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: const Icon(Icons.logout),
            label: const Text("Log Out"),
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                Colors.green[400],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
