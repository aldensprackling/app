import 'package:app/authentication_options.dart';
import 'package:flutter/material.dart';

class LoginPopup{
  static void displayLoginPopup(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          title: const Text("Login"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              // Email textfield
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),

              // Password textfield
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
            ],
          ),
          actions: [

            // Cancel button
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),

            // Login button
            ElevatedButton(
              onPressed: () {
                AuthenticationOptions.linkAccountWithAnonymousUser(emailController.text, passwordController.text);
                Navigator.of(context).pop();
              },
              child: const Text('Login'),
            ),
          ],
        );
      },
    );
  }
}