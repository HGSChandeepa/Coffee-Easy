import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:newappdemo/shared/constants.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  //form values
  String _currentName = "";
  String _currentSugars = "0";
  int? _currentStrength;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Text("update the brew settings"),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: textInputDecoration.copyWith(
                fillColor: Colors.green[100], hintText: "name"),
            validator: (value) =>
                value!.isEmpty ? "please enter the name" : null,
            onChanged: (value) => setState(() {
              _currentName = value;
            }),
          ),
          const SizedBox(
            height: 20,
          ),
          //dropdown

          DropdownButtonFormField(
            decoration: textInputDecoration,
            value: _currentSugars.isNotEmpty ? _currentSugars : null,
            items: sugars.map((sugar) {
              return DropdownMenuItem(
                value: sugar,
                child: Text('$sugar sugars'),
              );
            }).toList(),
            onChanged: (value) => setState(() {
              _currentSugars = value!;
            }),
          ),

          //slider
          Slider(
              activeColor: Colors.green[_currentStrength ?? 100],
              inactiveColor: Colors.green[100],
              min: 100,
              max: 900,
              value: (_currentStrength ?? 100).toDouble(),
              divisions: 8,
              onChanged: (val) {
                setState(() {
                  _currentStrength = val.round();
                });
              }),

          //button
          ElevatedButton(
            onPressed: () async {
              print(_currentName);
              print(_currentStrength);
              print(_currentSugars);
            },
            child: Text("Update"),
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.green)),
          )
        ],
      ),
    );
  }
}
