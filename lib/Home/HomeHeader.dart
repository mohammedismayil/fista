import 'package:flutter/cupertino.dart';
import 'package:flutterdemo/Home/HomeRestaurantCard.dart';

import 'ProfileCard.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Hello Ismayil"),
        Text("Welcome Back"),
        categoryview(),
        Text("Hello Ismayil"),

        restaurantsView(),
        Text("Welcome Back"),
        Text("Hello Ismayil"),
        Text("Welcome Back"),
        Text("Welcome Back"),
        Text("Hello Ismayil"),
        Text("Welcome Back"),
        Text("Welcome Back"),
        Text("Hello Ismayil"),
        Text("Welcome Back"),
        Text("Welcome Back"),
        Text("Hello Ismayil"),
        Text("Welcome Back"),
        Text("Welcome Back"),
        Text("Hello Ismayil"),
        Text("Welcome Back"),
        Text("Welcome Back"),
        Text("Hello Ismayil"),
        Text("Welcome Back"),
        Text("Welcome Back"),
        Text("Hello Ismayil"),
        Text("Welcome Back"),
        Text("Welcome Back"),
        // Text("Hello Ismayil"),
        // Text("Welcome Back"),
        // Text("Welcome Back"),
        // Text("Hello Ismayil"),
        // Text("Welcome Back"),
        // Text("Welcome Back"),
      ],
    );
  }

  SizedBox categoryview() {
    return SizedBox(
      height: 75,
      child: ListView(
        padding: const EdgeInsets.all(8),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Card(),
          Card(),
          Card(),
          Card(),
        ],
      ),
    );
  }

  SizedBox restaurantsView() {
    return SizedBox(
      height: 215,
      child: ListView(
        padding: const EdgeInsets.all(20),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          HomeRestaurantCard(),
          HomeRestaurantCard(),
          HomeRestaurantCard(),
          HomeRestaurantCard(),
        ],
      ),
    );
  }
}
