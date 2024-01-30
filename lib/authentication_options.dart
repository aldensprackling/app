import 'package:app/firestore_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationOptions {
  static Future<void> signInUserAnonymously(User? user) async {
    if (user == null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
        user = userCredential.user;
        FirestoreOptions.setRandomUsernameToUser(user);

        print('Signed in anonymously: ${user?.uid}');
      } catch (e) {
        print('Error signing in anonymously: $e');
      }
    } else {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('anonymous_users').doc(user.uid).get();
      print('User is signed in! ${user.uid}');
      print('Username: ${snapshot['username']}');
    }
  }

  static Future<void> linkAccountWithAnonymousUser(String email, String password) async {
    try {
      // Get the current user (should be the anonymous user)
      User? user = FirebaseAuth.instance.currentUser;

      // Create credentials for the permanent account
      AuthCredential userCredential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );

      // Link the anonymous user with the permanent account
      await user?.linkWithCredential(userCredential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'provider-already-linked' || e.code == 'email-already-in-use') {
        // If account is already linked or in use, sign the user in
        // try signing the user in
        signInUser(email, password);
      } else {
        print(e);
      }
    }
  }

  static Future<UserCredential?> signInUser(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print (e);
      }
      return null;
    }
  }

  static Future<void> signOutUser() async {
    try {
      await FirebaseAuth.instance.signOut();
      print("User is signed out.");
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  static Future<void> deleteUser() async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        print('The user must reauthenticate before this operation can be executed.');
      }
    }
  }
}