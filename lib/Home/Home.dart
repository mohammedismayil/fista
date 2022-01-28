import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/Constants/ThemeColors.dart';
import 'package:flutterdemo/Home/HomeCatgoryCard.dart';
import 'package:flutterdemo/Home/HomeHeader.dart';
import 'package:flutterdemo/Home/HomeRecommendedCard.dart';
import 'package:flutterdemo/Home/ProfileCard.dart';

class ListViewHome extends StatefulWidget {
  @override
  State<ListViewHome> createState() => _ListViewHomeState();
}

class _ListViewHomeState extends State<ListViewHome> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
    });
  }

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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_sharp),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.amber[800],
        selectedLabelStyle: TextStyle(fontSize: 15),
        onTap: _onItemTapped,
      ),
      
      body: SafeArea(

        
        child: 
       
        
        HomePageContainer(),
      ),
    );
  }
}

class HomePageContainer extends StatefulWidget {
  const HomePageContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePageContainer> createState() => _HomePageContainerState();
}

class _HomePageContainerState extends State<HomePageContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Expanded(
                child: Container(
                  child: Column(
                    children: [
                      HomeTopCategories(),
                      homeRecommended(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
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
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 22,
                  fontFamily: 'kobenhavn'),
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
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 22,
                  fontFamily: 'kobenhavn'),
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
