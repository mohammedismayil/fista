import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/Home/HomeHeader.dart';
import 'package:flutterdemo/Home/ProfileCard.dart';

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
      
         child: ListView(
        children: [
         
               Column(
            children: [
                   Container(
              decoration: BoxDecoration(color: Colors.white),
              child: HomeHeader()),
                 ],
          ),
          // ProfileCard(),
        ],
           
      ),
    );
  }
}
