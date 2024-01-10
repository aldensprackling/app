import 'package:app/user_options.dart';
import 'package:flutter/material.dart';

class MenuPopup extends StatelessWidget {
  const MenuPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.menu_rounded),
      iconSize: MediaQuery.sizeOf(context).width * 0.12,
      iconColor: Theme.of(context).primaryColor,
      position: PopupMenuPosition.under,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      onSelected: (String result) {
        if (result == "signOut") {
          UserOptions.signOutUser();
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'signOut',
          child: Row(
            children: [
              Icon(
                Icons.logout_rounded,
                color: Colors.red,
              ),
              SizedBox(width: 8),
              Text(
                'Sign Out',
                style: TextStyle(
                  color: Colors.red
                ),
              ),
            ],
          ),
        ),
      ],
    );        
  }
}