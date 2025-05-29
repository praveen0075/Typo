import 'package:flutter/material.dart';

void displayMsg(String msg, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(title: Text(msg)),
  );
}
