import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final color;
  final textcolor;
  final String buttontext;
  final buttontapped;

  Mybutton({
    this.color,
    this.textcolor,
    required this.buttontext,
    this.buttontapped,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttontext,
                style: TextStyle(
                  color: textcolor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
