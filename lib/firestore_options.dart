import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreOptions {
  static Future<void> setRandomUsernameToUser(User? user) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(user?.uid).set({
        'username': 'guest12345',
      });
      print('User added to Firestore successfully');
    } catch (e) {
      print('Error adding user to Firestore: $e');
    }
  }

  static Future<void> setUsernameToUser(User? user, String username) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(user?.uid).set({
        'username': username,
      });
      print('User added to Firestore successfully');
    } catch (e) {
      print('Error adding user to Firestore: $e');
    }
  }

  static Future<void> addRoom(String roomCode) async {

  }

  static Future<void> addUserToRoom(User? user) async {

  }
}