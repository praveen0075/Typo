import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_social_media/components/custom_button.dart';
import 'package:mini_social_media/components/custome_textfield.dart';
import 'package:mini_social_media/constants/sizedboxes.dart';
import 'package:mini_social_media/helper/helper_functions.dart';
import 'package:mini_social_media/pages/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  
  void loginUser() async {
    showDialog(
      context: context,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passWordController.text,
      );

        Navigator.pop(context); 
      

      Navigator.pushNamedAndRemoveUntil(context, "/home_page", (route) => true);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMsg(e.code, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                ],
              ),
              kh20,
              CustomButton(
                buttonText: "Login",
                onTap: () {
                  loginUser();
                },
              ),
              kh20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => SignupPage()),
                        (route) => false,
                      );
                    },
                    child: Text(
                      " Register Here",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
