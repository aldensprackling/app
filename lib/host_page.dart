import 'dart:math';
import 'package:app/user_grid.dart';
import 'package:flutter/material.dart';

class HostPage extends StatefulWidget {
  const HostPage({super.key});

  @override
  State<HostPage> createState() => _HostPageState();
}

class _HostPageState extends State<HostPage> {
  String get _code {
    final Random random = Random();
    const String characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    String code = '';

    for (int i = 0; i < 4; i++) {
      code += characters[random.nextInt(characters.length)];
    }

    return code;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Code: $_code"
        ),
      ),
      body: const UserGrid(),
    );
  }
}