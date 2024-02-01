import 'package:app/user_grid.dart';
import 'package:flutter/material.dart';

class JoinPage extends StatefulWidget {
  const JoinPage({super.key});

  @override
  State<JoinPage> createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  TextEditingController codeController = TextEditingController();
  String code = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: codeController,
          decoration: const InputDecoration(
            label: Text('Enter code'),
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                code = codeController.text;
              });
            },
            child: const Text('Submit'),
          ),
        ],
      ),
      body: code == '' ? Container() : UserGrid(code: code),
    );
  }
}