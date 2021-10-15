import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeRestaurantCard extends StatefulWidget {
  HomeRestaurantCard({Key? key}) : super(key: key);

  @override
  _HomeRestaurantCardState createState() => _HomeRestaurantCardState();
}

class _HomeRestaurantCardState extends State<HomeRestaurantCard> {
  @override
  Widget build(BuildContext context) {
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
                    "Cheese Burger",
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
