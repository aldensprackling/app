import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreOptions {
  static Future<void> setRandomUsernameToUser(User? user) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(user?.uid).set({
        'username': 'guest12345',
      });
      print('Username added to Firestore successfully');
    } catch (e) {
      print('Error adding username to Firestore: $e');
    }
  }

  static Future<void> setUsernameToUser(User? user, String username) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(user?.uid).set({
        'username': username,
      });
      print('Username added to Firestore successfully');
    } catch (e) {
      print('Error adding username to Firestore: $e');
    }
  }

  static Future<void> createRoom(User? user, String roomCode) async {
    try {
      await FirebaseFirestore.instance.collection('rooms').doc(roomCode.toString()).set({
        'users': [FirebaseFirestore.instance.collection('users').doc(user?.uid)],
      });
      print('Room added to Firestore successfully');
    } catch (e) {
      print('Error adding room to Firestore: $e');
    }
  }

  static Future<void> deleteRoom(String roomCode) async {
    try {
      await FirebaseFirestore.instance.collection('rooms').doc(roomCode.toString()).delete();
      print('Room deleted from Firestore successfully');
    } catch (e) {
      print('Error deleting room from Firestore: $e');
    }
  }

  static Future<bool> addUserToRoom(User? user, String roomCode) async {
    try {
      await FirebaseFirestore.instance.collection('rooms').doc(roomCode.toString()).update({
        'users': FieldValue.arrayUnion([FirebaseFirestore.instance.collection('users').doc(user?.uid)]),
      });
      print('Added user to room in Firestore successfully');
      return true;
    } catch (e) {
      print('Error adding user to room in Firestore: $e');
      return false;
    }
  }

  static Future<bool> deleteUserFromRoom(User? user, String roomCode) async {
    try {
      await FirebaseFirestore.instance.collection('rooms').doc(roomCode.toString()).update({
        'users': FieldValue.arrayRemove([FirebaseFirestore.instance.collection('users').doc(user?.uid)]),
      });
      print('Deleted user from room in Firestore successfully');
      return true;
    } catch (e) {
      print('Error deleting user from room in Firestore: $e');
      return false;
    }
  }

  static Future<bool> doesRoomExist(String roomCode) async {
    try {
      DocumentSnapshot roomSnapshot = await FirebaseFirestore.instance.collection('rooms').doc(roomCode.toString()).get();
      if (roomSnapshot.exists) {
        print("Room exists in firestore");
        return true;
      } else {
        print("Room does not exist in firestore");
        return false;
      }
    } catch (e) {
      print('Room does not exist in firestore: $e');
      return false;
    }
  }
}