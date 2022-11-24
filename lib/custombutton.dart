import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrangeButton extends StatelessWidget {

  final String title;
  final double width;
  final Function onTap;

   // ignore: use_key_in_widget_constructors
   const OrangeButton({ required this.title, required this.onTap, this.width = 200}) ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> onTap(),
      child: Container(
        width: width,
        padding: const EdgeInsets.all(10),

        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: const Color(0xffF05A28),
          ),

          padding: const EdgeInsets.symmetric(vertical:12.0, horizontal: 20.0),

          child: Center(child: Text(title, style: const TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),)),

        ),
      ),
    );
  }
}