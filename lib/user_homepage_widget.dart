import 'package:app/login_popup.dart';
import 'package:app/username_popup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserHomepageWidget extends StatefulWidget {
  const UserHomepageWidget({super.key});

  @override
  State<UserHomepageWidget> createState() => _UserHomepageWidgetState();
}

class _UserHomepageWidgetState extends State<UserHomepageWidget> {
  final Stream<DocumentSnapshot<Map<String, dynamic>>> _userStream = FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: _userStream,
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.hasError) {
          return Text("$snapshot.error");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator()
          );
        }

        return GestureDetector(
          onTap: () {
            FirebaseAuth.instance.currentUser!.isAnonymous ? LoginPopup.displayLoginPopup(context) : Container();
          },
          child: Column(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 0.90,
                height: MediaQuery.sizeOf(context).width * 0.90,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),

              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.025,
              ),

              GestureDetector(
                onTap: () {
                  UsernamePopup.displayUsernamePopup(context);
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.90,
                  height: MediaQuery.sizeOf(context).height * 0.10,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Center(
                    child: Text(
                      snapshot.hasData ? snapshot.data!['username'] : "Username Error: click to add new username",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    )
                  ),
                ),
              ),
            ],
          ),
        ); 
      },
    );
  }
}
