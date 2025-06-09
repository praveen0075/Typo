
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mini_social_media/components/custom_button.dart';
import 'package:mini_social_media/components/custom_drawer.dart';
import 'package:mini_social_media/components/custome_textfield.dart';
import 'package:mini_social_media/constants/sizedboxes.dart';
import 'package:mini_social_media/database/firestore.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Firestore db = Firestore();
    TextEditingController msgController = TextEditingController();

    void sendMsg() {
      if (msgController.text.isNotEmpty) {
        db.addPost(msgController.text);
      }
      msgController.clear();
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: AppBar(title: Text("Home page")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: CustomeTextfield(
                    hintText: "Type something",
                    obscure: false,
                    txtController: msgController,
                  ),
                ),
                kw10,
                CustomButton(buttonText: "Send", onTap: sendMsg),
              ],
            ),
          ),
          StreamBuilder(
            stream: db.getPosts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error : ${snapshot.error}"));
              } else if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                return Center(child: Text("No data"));
              } else {
                final posts = snapshot.data!.docs;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    final msg = post['message'];
                    final email = post['currentUserEmail'];
                     log(msg); 
                    return ListTile(
                      title: Text(
                        msg,
                        style: TextStyle(
                          color: Colors.black
                        ),
                      ),
                      subtitle: Text(msg),
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
      drawer: CustomDrawer(),
    );
  }
}
