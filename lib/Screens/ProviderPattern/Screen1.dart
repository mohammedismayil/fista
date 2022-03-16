import 'package:flutter/material.dart';
import 'package:flutterdemo/Screens/ProviderPattern/LocationProvider.dart';
import 'package:flutterdemo/Screens/ProviderPattern/Screen2.dart';
import 'package:provider/provider.dart';

import 'CounterProvider.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LocationText(),
            
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
                    MaterialPageRoute(builder: (context) => Screen2()),
                  );
                },
                child: Text("movetonext")),
            TextField(
              textAlign: TextAlign.center,
              onSubmitted: (value) =>
                  {context.read<LocationProvider>().setLocation(value)},
              onChanged: (value) => {},
            )
          ],
        ),
      ),
    ));
  }
}
