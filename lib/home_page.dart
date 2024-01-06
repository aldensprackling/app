import 'package:app/main.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

            // Personal account
            GestureDetector(
              onTap: () {
                // Handle container click
                print('Container clicked!');
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.90,
                height: MediaQuery.sizeOf(context).height * 0.40,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: const Center(
                  child: Text(
                    'Click me!',
                  ),
                ),
              ),
            ),

            // Host button
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.90,
              height: MediaQuery.sizeOf(context).height * 0.10,
              child: ElevatedButton(
                onPressed: () {
                // Add the functionality you want when the button is pressed
                print('Button pressed!');
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                child: const Text("Host"),
              ),
            ),

            // Join button
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.90,
              height: MediaQuery.sizeOf(context).height * 0.10,
              child: ElevatedButton(
                onPressed: () {
                // Add the functionality you want when the button is pressed
                print('Button pressed!');
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                child: const Text("Join"),
              ),
            )
          ],
        ),
      ),
    );
  }
}