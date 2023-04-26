import 'package:flutter/material.dart';
import 'package:newappdemo/models/brew.dart';

class BrewTile extends StatelessWidget {
  final Brew brew;
  BrewTile({Key? key, required this.brew}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Card(
        margin: const EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.green[brew.strength],
          ),
          title: Text(brew.name),
          subtitle: Text("Takes ${brew.sugars} sugars"),
        ),
      ),
    );
  }
}
