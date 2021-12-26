import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.red,
        child: Column(
          children: [
            // Image(image: AssetImage('/assets/images/welcome.png')),
            Text('Enterprise Team collabration',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                )),
          ],
        ),
      ),
    );
  }
}
