import 'package:app/firestore_options.dart';
import 'package:app/home_page.dart';
import 'package:app/user_grid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class JoinPage extends StatefulWidget {
  const JoinPage({super.key});

  @override
  State<JoinPage> createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  TextEditingController codeController = TextEditingController();
  bool isFourCharacters = false;
  bool roomExists = false;
  bool loading = false;
  bool userAdded = false;

  @override
  void initState() {
    super.initState();
    codeController.addListener(_checkTextField);
  }

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  void _checkTextField() {
    setState(() {
      isFourCharacters = codeController.text.length == 4;
      roomExists = false;
      if (isFourCharacters) {
        loading = true;
        FirestoreOptions.doesRoomExist(codeController.text).then((doesRoomExist) {
          setState(() {
            loading = false;
            roomExists = doesRoomExist;
            if (roomExists) {
              FirestoreOptions.addUserToRoom(FirebaseAuth.instance.currentUser, codeController.text).then((wasUserAdded) {
                setState(() {
                  userAdded = wasUserAdded;
                });
              });
            }
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
            if (userAdded && roomExists) {
              FirestoreOptions.deleteUserFromRoom(FirebaseAuth.instance.currentUser, codeController.text);
            }
          },
        ),
        title: TextField(
          autocorrect: false,
          enableSuggestions: false,
          readOnly: isFourCharacters,
          showCursor: !isFourCharacters,
          textCapitalization: TextCapitalization.characters,
          controller: codeController,
          maxLength: 4,
          decoration: const InputDecoration(
            labelText: 'Enter code',
          ),
        ),
      ),
      body: roomExists ? UserGrid(roomCode: codeController.text) : Container(),
    );
  }
}