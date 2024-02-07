import 'package:app/firestore_options.dart';
import 'package:app/home_page.dart';
import 'package:app/user_grid.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class JoinPage extends StatefulWidget {
  const JoinPage({super.key});

  @override
  State<JoinPage> createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  TextEditingController textfieldController = TextEditingController();
  FocusNode textfieldFocusNode = FocusNode();
  bool isFourCharacters = false;
  bool roomExists = false;
  bool loading = false;
  bool userAdded = false;
  String code = '';

  @override
  void dispose() {
    textfieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
            if (userAdded && roomExists) {
              FirestoreOptions.deleteUserFromRoom(FirebaseAuth.instance.currentUser, code);
            }
          },
        ),
        title: Pinput(
          autofocus: true,
          focusNode: textfieldFocusNode,
          controller: textfieldController,
          readOnly: isFourCharacters,
          enableSuggestions: false,
          textCapitalization: TextCapitalization.characters,
          length: 4,
          onChanged: (text) {
            if (text.length == 4) {
              setState(() {
                loading = true;
                isFourCharacters = true;
              });
              FirestoreOptions.doesRoomExist(text).then((doesRoomExist) {
                setState(() {
                  code = text;
                  roomExists = doesRoomExist;
                  if (roomExists) {
                    FirestoreOptions.addUserToRoom(FirebaseAuth.instance.currentUser, text).then((wasUserAdded) {
                      setState(() {
                        loading = false;
                        userAdded = wasUserAdded;
                      });
                    });
                  } else {
                    textfieldController.clear();
                    isFourCharacters = false;
                    loading = false;
                    textfieldFocusNode.requestFocus();
                  }
                });
              });
            }
          },
        ),
      ),
      body: roomExists ? UserGrid(roomCode: code) : Container(),
    );
  }
}