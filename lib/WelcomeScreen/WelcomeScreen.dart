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
        // #12101a

        color: Color(0xff12101a),
        child: Column(
          children: [
            // Image(image: AssetImage('/assets/images/welcome.png')),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('Enterprise Team collabration',
                      textAlign: TextAlign.center,
                      
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white,
                      )),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, right: 20, left: 20),
                    child: Text(
                        'Bring together your files,tools,projects and people.Including a new desktop and mobile application',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.grey,
                        )),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Enabled ok'),
                    ),
                   
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
