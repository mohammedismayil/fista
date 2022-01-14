import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/Constants/ThemeColors.dart';
import 'package:flutterdemo/Home/HomeCatgoryCard.dart';
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

    return Scaffold(
      backgroundColor: AppTheme().lightGray,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              HomeHeader(),
              HomeTopCategories(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget HomeTopCategories() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 25,left:15),
        child: Row(
          children: [
            Text(
              "Something new",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black, fontSize: 22),
            ),
            
          ],
        ),
      ),
     SingleChildScrollView(

       scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              HomeCategoryCard(),
               HomeCategoryCard(),
                HomeCategoryCard(),
                 HomeCategoryCard()
            ],
          ),
     )
    ],
  );
}
