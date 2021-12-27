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
                  Padding(
                    padding: const EdgeInsets.only(top: 50,bottom: 50),
                    child: Container(child: Image.network('https://picsum.photos/250?image=9')),
                  ),
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
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          ElevatedButton(onPressed: () {

                          }
                          , child: Text("Register")),
                           ElevatedButton(onPressed: () {

                          }
                          , child: Text("Login"))
                        ],
                      ),
                    ],
                  )
                 
                ],
                
            ),
          ),
        ],
      ),
    ));
  }
}
