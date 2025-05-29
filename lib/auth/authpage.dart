import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_social_media/pages/home_page.dart';
import 'package:mini_social_media/pages/login_page.dart';

class Authpage extends StatelessWidget {
  const Authpage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder:
          (context, snapshot) => snapshot.hasData ? HomePage() : LoginPage(),
    );
  }
}
