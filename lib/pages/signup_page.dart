import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_social_media/components/custom_button.dart';
import 'package:mini_social_media/components/custome_textfield.dart';
import 'package:mini_social_media/constants/sizedboxes.dart';
import 'package:mini_social_media/helper/helper_functions.dart';
import 'package:mini_social_media/pages/login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

  void signUpTheUser() async {
    log("button clicked");
    showDialog(
      context: context,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    if (passWordController.text != confirmPasswordController.text) {
      Navigator.pop(context);
      displayMsg("passwords doesn't match", context);
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: emailController.text,
              password: passWordController.text,
            );

        try {
          createUserDoc(userCredential);
        } catch (e) {
          log(e.toString());
        }

        Navigator.pop(context);
        Navigator.pushNamedAndRemoveUntil(
          context,
          "/home_page",
          (route) => true,
        );
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);

        displayMsg(e.code, context);
      }
    }
  }

  Future<void> createUserDoc(UserCredential userCredential) async {
    if (userCredential.user != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.email)
          .set({
            "email": userCredential.user!.email,
            "username": usernameController.text,
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  size: 80,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                kh20,
                Text("H E L L O   W O R L D", style: TextStyle(fontSize: 20)),
                kh30,
                CustomeTextfield(
                  hintText: "username",
                  obscure: false,
                  txtController: usernameController,
                ),
                kh10,
                CustomeTextfield(
                  hintText: "Email",
                  obscure: false,
                  txtController: emailController,
                ),
                kh10,
                CustomeTextfield(
                  hintText: "Password",
                  obscure: true,
                  txtController: passWordController,
                ),
                kh10,
                CustomeTextfield(
                  hintText: "Confirm Password",
                  obscure: true,
                  txtController: confirmPasswordController,
                ),
                kh20,
                CustomButton(
                  buttonText: "Register",
                  onTap: () {
                    signUpTheUser();
                  },
                ),
                kh20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                          (route) => false,
                        );
                      },
                      child: Text(
                        " Login Here",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
