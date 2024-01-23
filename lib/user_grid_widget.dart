import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserGridWidget extends StatefulWidget {
  final String username;

  const UserGridWidget({super.key, required this.username});

  @override
  State<UserGridWidget> createState() => _UserGridWidgetState();
}

class _UserGridWidgetState extends State<UserGridWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.266,
      height: MediaQuery.sizeOf(context).width * 0.266,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Text(widget.username)
    );
  }
}