import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Row.dart';

class ListViewHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return ListView(
    //   padding: const EdgeInsets.all(50),
    //   children: <Widget>[
    //     Text('List 1'),
    //     Text('List 2'),
    //     Text('List 3'),
    //   ],

    // );

    return SafeArea(
        child: Row(
      children: [
        Text(
          "Mohabbat",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          "Hello world",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
          onPressed: () {},
          child: Text('Click Here'),
        )
        
      ],
    ));
  }
}
