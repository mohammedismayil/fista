import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/Constants/ThemeColors.dart';
import 'package:flutterdemo/Home/HomeRestaurantCard.dart';

import 'ProfileCard.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;

class HomeHeader extends StatefulWidget {
  HomeHeader({Key? key}) : super(key: key);

  @override
  _HomeHeaderState createState() => _HomeHeaderState();
}
//  borderRadius: BorderRadius.only(bottomLeft:Radius.circular(30),bottomRight:Radius.circular(30)),
class _HomeHeaderState extends State<HomeHeader> {
  @override
  void initState() {
    super.initState();
    print("heheh");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme().white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
            child: locationText(),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 15),
            child: SearchBar(),
          ),
        ],
      ),
    );
  }

  greetingView() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 10,
        bottom: 10,
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi Ismayil",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 17)),
            Text("Welcome Back",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 30)),
          ]),
    );
  }

  notificationView() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        top: 30,
        right: 10,
        bottom: 10,
      ),
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

  Widget locationText() {
    return Row(children: [
      Icon(
        Icons.location_on,
        color: AppTheme().themeYellow,
        size: 30.0,
      ),
      Text("800 Chinese Avenue,NYC")
    ]);
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

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppTheme().lightGray,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search for food',
              border: InputBorder.none,
            ),
            onChanged: (text) {
              print('First text field: $text');
            },
          ),
        ],
      ),
    );
  }
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
