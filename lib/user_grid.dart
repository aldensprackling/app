import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserGrid extends StatefulWidget {
  final String code;

  const UserGrid({required this.code, super.key});

  @override
  State<UserGrid> createState() => _UserGridState();
}

class _UserGridState extends State<UserGrid> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection('rooms').doc(widget.code).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Error getting room snapshot');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator()
          );
        }

        // Should not be able to reach this point
        if (!snapshot.hasData || snapshot.data == null) {
          return const Text("No room found");
        }

        Map<String, dynamic>? roomData = snapshot.data!.data() as Map<String, dynamic>?;

        // Catches if room is deleted or no users are found
        if (roomData == null || !roomData.containsKey('users') || roomData['users'] is! List) {
          return const Center(
            child: Text("No users found"),
          );
        }

        List<dynamic> userReferences = roomData['users'];

        return CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverGrid.builder(
                itemCount: userReferences.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                ),
                itemBuilder: (BuildContext context, int index) {
                  DocumentReference documentReference = userReferences[index];

                  return FutureBuilder<DocumentSnapshot>(
                    future: documentReference.get(), 
                    builder: ((context, snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Error referencing user document');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      // Should not be able to reach this point
                      if (!snapshot.hasData || snapshot.data == null) {
                        return const Text("Not able to retrieve players");
                      }

                      Map<String, dynamic>? documentData = snapshot.data!.data() as Map<String, dynamic>?;

                      // Catches if there no user or if there is not a username field
                      if (documentData == null || !documentData.containsKey('username')) {
                        return const Center(
                          child: Text('No user data found'),
                        );
                      }

                      String username = documentData['username'];

                      return Container(
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                            Text(username),
                          ],
                        ),
                      );
                  }));
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
