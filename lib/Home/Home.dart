import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/Constants/ThemeColors.dart';
import 'package:flutterdemo/Home/HomeCatgoryCard.dart';
import 'package:flutterdemo/Home/HomeHeader.dart';
import 'package:flutterdemo/Home/HomeRecommendedCard.dart';
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
      backgroundColor: AppTheme().white,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(20)),
                    // boxShadow: [
                    //   BoxShadow(
                    //     offset: Offset(2.0, 2.0),
                    //     blurRadius: 5,
                    //     color: Colors.black.withOpacity(0.3),
                    //   ),
                    // ],
                  ),
                  child: HomeHeader()),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    HomeTopCategories(),
                    homeRecommended(),
                  ],
                ),
              ),
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
        padding: const EdgeInsets.only(top: 10, left: 15, bottom: 10),
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
Widget homeRecommended() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 15, bottom: 10),
        child: Row(
          children: [
            Text(
              "Recommended",
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
              HomeRecommendedCard(),
               HomeRecommendedCard(),
                HomeRecommendedCard(),
                 HomeRecommendedCard()
            ],
          ),
     )
    ],
  );

  
}
