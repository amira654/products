import 'package:flutter/material.dart';

AppBar customAppBar({required String title}) {
  return AppBar(
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      elevation: 5,
      backgroundColor: Colors.teal);
}
