import 'package:flutter/material.dart';
import 'package:newappdemo/models/brew.dart';
import 'package:newappdemo/screens/home/settings_form.dart';
import 'package:newappdemo/services/auth.dart';
import 'package:newappdemo/services/database.dart';
import 'package:provider/provider.dart';

import 'brew_list.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.all(50),
              child: SettingsForm(),
            );
          });
    }

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
            FilledButton.icon(
              onPressed: () {
                _showSettingsPanel();
              },
              icon: const Icon(Icons.settings),
              label: const Text("Settings"),
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
