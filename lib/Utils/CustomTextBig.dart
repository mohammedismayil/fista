import 'package:flutter/material.dart';

class CustomTextBig extends StatelessWidget {
  const CustomTextBig({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Hello",
      style: TextStyle(fontSize: 25),
    );
  }
}
