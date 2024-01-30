import 'package:app/firestore_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UsernamePopup {
  static final TextEditingController _usernameController = TextEditingController();

  static void displayUsernamePopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Username'),
          content: TextFormField(
            controller: _usernameController,
            decoration: const InputDecoration(
              hintText: 'Enter your username',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                String username = _usernameController.text;
                FirestoreOptions.setUsernameToUser(FirebaseAuth.instance.currentUser, username);
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}