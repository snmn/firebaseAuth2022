// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class AppInputField extends StatelessWidget {

  final String hinttext;
  final TextEditingController controller;
  const AppInputField({Key? key, required this.hinttext, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding:
          const EdgeInsets.symmetric(vertical: 12, horizontal: 22),
          filled: true,
          fillColor: Colors.white,
          hintText: hinttext,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
          hintStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}