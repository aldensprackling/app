import 'package:app/firestore_options.dart';
import 'package:app/home_page.dart';
import 'package:app/logic.dart';
import 'package:app/user_grid.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HostPage extends StatefulWidget {
  const HostPage({super.key});

  @override
  State<HostPage> createState() => _HostPageState();
}

class _HostPageState extends State<HostPage> {
  String code = Logic.getRandomRoomCode();

  @override
  Widget build(BuildContext context) {
    FirestoreOptions.createRoom(FirebaseAuth.instance.currentUser, code);

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
            FirestoreOptions.deleteRoom(code);
          },
        ),
        title: Text(
          "Code: $code"
        ),
      ),
      body: UserGrid(
        roomCode: code,
      ),
    );
  }
}