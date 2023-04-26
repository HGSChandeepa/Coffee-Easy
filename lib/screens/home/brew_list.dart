import 'package:flutter/material.dart';
import 'package:newappdemo/models/brew.dart';
import 'package:provider/provider.dart';

import 'brew_tiles.dart';

class BrewList extends StatelessWidget {
  const BrewList({Key? key});

  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>?>(context);
    //create a list view builder

    return ListView.builder(
      itemCount: brews?.length ?? 0,
      itemBuilder: (context, index) {
        return BrewTile(brew: brews![index]);
      },
    );
  }
}
