import 'package:app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) async {
    if (user == null) {
      // User is not signed in, sign them in anonymously
      // They don't have an option
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
        user = userCredential.user;
        print('Signed in anonymously: ${user?.uid}');
      } catch (e) {
        print('Error signing in anonymously: $e');
      }
    } else {
      print('User is signed in! ${user.uid}');
    }
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}