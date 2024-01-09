import 'package:flutter/material.dart';

class UserGrid extends StatefulWidget {
  const UserGrid({super.key});

  @override
  State<UserGrid> createState() => _UserGridState();
}

// TODO: fix grid by adding UserWidgets
class _UserGridState extends State<UserGrid> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverGrid.count(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              // TODO: add user widgets here
            ],
          ),
        ),
      ],
    );
  }
}