import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppInputField extends StatelessWidget {

  final String hinttext;
   // ignore: use_key_in_widget_constructors
   const AppInputField(this.hinttext);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextField(
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