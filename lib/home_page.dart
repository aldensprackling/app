import 'package:app/host_page.dart';
import 'package:app/join_page.dart';
import 'package:app/user_homepage_widget.dart';
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
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // User homepage widget
            const UserHomepageWidget(),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Host button
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.425,
                  height: MediaQuery.sizeOf(context).height * 0.10,
                  child: ElevatedButton(
                    onPressed: () {  
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HostPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: const Icon(Icons.group_rounded),
                  ),
                ),

                // Join button
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.425,
                  height: MediaQuery.sizeOf(context).height * 0.10,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const JoinPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: const Icon(Icons.person_add_alt_1_rounded),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}