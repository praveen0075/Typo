import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_social_media/constants/sizedboxes.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    void logOut() {
      FirebaseAuth.instance.signOut();
    }

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(child: Icon(Icons.settings_applications)),
          kh10,
          ListTile(
            leading: Icon(
              Icons.home,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            title: Text("H O M E"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            title: Text("P R O F I L E"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/profile_page");
            },
          ),
          ListTile(
            leading: Icon(
              Icons.group,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            title: Text("U S E R S"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/users_page");
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            title: Text("L O G  O U T"),
            onTap: () {
              logOut();
              Navigator.pushNamedAndRemoveUntil(
                context,
                "/login_page",
                (route) => true,
              );
            },
          ),
        ],
      ),
    );
  }
}
