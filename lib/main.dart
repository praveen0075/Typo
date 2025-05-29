import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mini_social_media/auth/authpage.dart';
import 'package:mini_social_media/firebase_options.dart';
import 'package:mini_social_media/pages/home_page.dart';
import 'package:mini_social_media/pages/login_page.dart';
import 'package:mini_social_media/pages/profile_page.dart';
import 'package:mini_social_media/pages/users_page.dart';
import 'package:mini_social_media/theme/dart_mode.dart';
import 'package:mini_social_media/theme/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Authpage(),
      theme: lightMode,
      darkTheme: darkMode,
      routes: {
        "/login_page" : (context)=> LoginPage(),
        "/home_page" : (context)=> HomePage(), 
        "/users_page" : (context) => UsersPage(),
        "/profile_page": (context) => ProfilePage()
      },
    );
  }
}
