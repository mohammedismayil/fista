import 'package:flutter/material.dart';
import 'package:flutterdemo/Constants/ThemeColors.dart';

class HomeRecommendedCard extends StatefulWidget {
  const HomeRecommendedCard({Key? key}) : super(key: key);

  @override
  _HomeRecommendedCardState createState() => _HomeRecommendedCardState();
}

class _HomeRecommendedCardState extends State<HomeRecommendedCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppTheme().themeYellow,
        ),
        child: Column(
          children: [
            Image.asset("assets/images/pizza.jpeg"),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(children: [
                Text("Sushi"),

                // Container(
                //     height: 200,
                //     width: 150,
                //     decoration: BoxDecoration(
                //         image: DecorationImage(image: Image.asset('../'))),
                // )],
              ]),
            ),
            Row(
              children: [Text("Heaven's Park")],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: RatingRow(),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: timeRow(),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: starRow(),
                ),
              ],
            ),
            storeCategoryRow(),
          ],
        ),
      ),
    );
  }
}

Widget RatingRow() {
  return Row(
    children: [
      Icon(
        Icons.star,
        size: 15,
      ),
      Text("4.5")
    ],
  );
}

Widget timeRow() {
  return Row(
    children: [Icon(Icons.access_time_sharp, size: 15), Text("25-30min")],
  );
}

Widget starRow() {
  return Row(
    children: [Text('\$\$\$\$')],
  );
}

Widget storeCategoryRow() {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          margin: EdgeInsets.only(right: 20, left: 20),
          child: Center(child: Text('Fish')),
          color: Colors.white,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          margin: EdgeInsets.only(right: 20, left: 20),
          child: Center(child: Text('Fish')),
          color: Colors.white,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          margin: EdgeInsets.only(right: 20, left: 20),
          child: Center(child: Text('Fish')),
          color: Colors.white,
        ),
      ),
    ],
  );
}
