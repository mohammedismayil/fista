import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CounterProvider.dart';
import 'LocationProvider.dart';

class Screen3 extends StatefulWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Container(
        child: Column(
          children: [

            Text("Screen 3"),
            LocationText(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Cart items count"),
                Count(),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<Counter>().increment();
                },
                child: Text("movetonext"))
          ],
        ),
      )),
    );
  }
}
