import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/Home/HomeRestaurantCard.dart';

import 'ProfileCard.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;

class HomeHeader extends StatefulWidget {
  HomeHeader({Key? key}) : super(key: key);

  @override
  _HomeHeaderState createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  

  @override
  void initState() {
    super.initState();
    print("heheh");
    
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      
      children: [
        notificationView(),
        Row(
          children: [
            greetingView(),
          ],
        ),
       
      ],
    );
  }

  Column greetingView() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Hi Ismayil",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 16)),
          Text("Welcome Back",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18)),
        ]);
  }

   notificationView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Image(
            image: NetworkImage(
                "https://img.icons8.com/material-outlined/2x/appointment-reminders.png"),
            height: 25,
            width: 25),
        Image(
            image: NetworkImage(
                "https://img.icons8.com/material-outlined/2x/appointment-reminders.png"),
            height: 25,
            width: 25),
      ]),
    );
  }

  // SizedBox categoryview() {
  //   return SizedBox(
  //     height: 75,
  //     child: ListView(
  //       padding: const EdgeInsets.all(8),
  //       scrollDirection: Axis.horizontal,
  //       children: <Widget>[
  //         Card(),
  //         Card(),
  //         Card(),
  //         Card(),
  //       ],
  //     ),
  //   );
  // }


}

class Album {
  final int userId;
  final int id;
  final String title;

  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
