import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        //  Row(
        //   children: [
        //     Image.asset(
        //       '/assets/images/profile.jpg',
        //       height: 100,
        //       width: 30,
        //       fit: BoxFit.fill,
        // ),
        //    ],
        // ),
        // Text(
        //   "Hello world",
        //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        // ),
        // TextButton(
        //   style: ButtonStyle(
        //     foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        //   ),
        //   onPressed: () {},
        //   child: Text('Click Here'),
        // ),
        // ListView(
        //   // This next line does the trick.
        //   // shrinkWrap: true, //just set this property
        //   // padding: const EdgeInsets.all(50),
        //   scrollDirection: Axis.horizontal,
        //   children: <Widget>[
        //     Container(
        //       width: 160.0,
        //       color: Colors.red,
        //     ),
        //     Container(
        //       width: 160.0,
        //       color: Colors.blue,
        //     ),
        //     Container(
        //       width: 160.0,
        //       color: Colors.green,
        //     ),
        //     Container(
        //       width: 160.0,
        //       color: Colors.yellow,
        //     ),
        //     Container(
        //       width: 160.0,
        //       color: Colors.orange,
        //     ),
        //   ],
        // )
      ],
    ));
  }
}
