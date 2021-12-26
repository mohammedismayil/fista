import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.restaurant,
  });

  List<Restaurant> restaurant;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        restaurant: List<Restaurant>.from(
            json["restaurant"].map((x) => Restaurant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "restaurant": List<dynamic>.from(restaurant.map((x) => x.toJson())),
      };
}

class Restaurant {
  Restaurant({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.rating,
    required this.image,
  });

  String id;
  String name;
  String category;
  String price;
  String rating;
  String image;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        price: json["price"],
        rating: json["rating"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category,
        "price": price,
        "rating": rating,
        "image": image,
      };
}

class HomeRestaurantCard extends StatefulWidget {

  final Restaurant restaurant;
  HomeRestaurantCard(
    String s, {
    Key? key,
    required this.restaurant,
  }) : super(key: key);

    
  @override
  _HomeRestaurantCardState createState() => _HomeRestaurantCardState();
}

class _HomeRestaurantCardState extends State<HomeRestaurantCard> {
  @override
  Widget build(BuildContext context) {
    // final Restaurant restaurant;
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5),
      width: 170,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey,
        // border: Border.all(
        //   color: Colors.black,
        // ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Image(
              image: NetworkImage(
                  "https://media.istockphoto.com/photos/pizza-picture-id184946701?k=20&m=184946701&s=612x612&w=0&h=LRc4BfIMzP3QW9QKr5eria66F1ZeV2EY8xXeva-E6io="),
              height: 100,
              width: 150),
          Row(
            children: [
              Column(
                children: [
                  Text(
                  widget.restaurant.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    "Fresh Patty",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Image(
                  image: NetworkImage(
                      "https://www.starpng.com/public/uploads/preview/5-star-rating-png-21573998074syeo5vib9a.png"),
                  height: 40,
                  width: 50),
            ],
          ),
        ],
      ),
    );
  }
}
