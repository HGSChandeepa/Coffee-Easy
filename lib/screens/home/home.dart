import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newappdemo/models/brew.dart';
import 'package:newappdemo/screens/home/brewList.dart';
import 'package:newappdemo/services/auth.dart';
import 'package:newappdemo/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    //this is returning list of brewa
    return StreamProvider<List<Brew>?>.value(
      value: DatabaseService(uid: '').brews,
      initialData: null,
      child: Scaffold(
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
        body: BrewList(),
      ),
    );
  }
}
