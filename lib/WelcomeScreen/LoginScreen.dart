import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  loginButtonAction() {
    print("hey you have tapped this");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Route"),
      ),
      backgroundColor: Color(0xff12101a),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Center(
              child: Text('Let sign you in',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.white,
                  )),
            ),
          ),
          Text('Welcome back',
              textAlign: TextAlign.center,
              style: TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              )),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('you have been missed !',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.white,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.grey[800], filled: true)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.grey[800], filled: true)),
                ),
              ],
            ),
          ),
          Text('dont have an accounr ? Register',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.white,
              )),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: ElevatedButton(
              onPressed: () {
                loginButtonAction();
              },
              child: Text("Login"),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black, //
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
