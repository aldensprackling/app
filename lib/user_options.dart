import 'package:firebase_auth/firebase_auth.dart';

class UserOptions {
  static Future<void> linkAccountWithAnonymous(String email, String password) async {
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
    } catch (e) {
      print('Error linking accounts: $e');
      signInUser(email, password);
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
      }
      return null;
    }
  }

  static Future<void> signOutUser() async {
    await FirebaseAuth.instance.signOut();
  }

  // TODO: add reauthentication method
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