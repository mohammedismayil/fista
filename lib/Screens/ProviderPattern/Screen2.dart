import 'package:flutter/material.dart';
import 'package:flutterdemo/Screens/ProviderPattern/Screen3.dart';
import 'package:provider/provider.dart';

import 'CounterProvider.dart';
import 'LocationProvider.dart';
class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LocationText(),
              Text("Counter count"),
              Count(),
              ElevatedButton(
                  onPressed: () {
                    context.read<Counter>().increment();
                  },
                  child: Text("movetonext")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Screen3()),
                    );
                  },
                  child: Text("Move to 3rd screen"))
            ],
          ),
        ),
      )),
    );
  }
}
