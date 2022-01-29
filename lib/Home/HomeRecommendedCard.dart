import 'package:flutter/material.dart';
import 'package:flutterdemo/Constants/ThemeColors.dart';
import 'package:flutterdemo/Screens/StoreDetails.dart';

class HomeRecommendedCard extends StatefulWidget {
  const HomeRecommendedCard({Key? key}) : super(key: key);

  

  @override
  _HomeRecommendedCardState createState() => _HomeRecommendedCardState();
}

class _HomeRecommendedCardState extends State<HomeRecommendedCard> {
  int containerIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Container(
          width: 270,
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(10),
          //   color: AppTheme().themeYellow,
          // ),
          child: Expanded(
            child: Column(
              children: [
                Container(
                  width: 270,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                      image: AssetImage("assets/images/pizza.jpeg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Text(
                              "Heaven's Park",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          RatingRow(),
                          SizedBox(width: 7),
                          timeRow(),
                          SizedBox(width: 7),
                          starRow(),
                        ],
                      ),
                      storeCategoryRow(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        onTap: () {

          Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const StoreDetailScreen()),
  );
          print("Tapped on container $containerIndex");
        },
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
      SizedBox(width: 2),
      Text("4.5")
    ],
  );
}

Widget timeRow() {
  return Row(
    children: [
      Icon(Icons.access_time_sharp, size: 15),
      SizedBox(width: 2),
      Text("25-30min")
    ],
  );
}

Widget starRow() {
  return Row(
    children: [Text('\$\$\$\$')],
  );
}

Widget storeCategoryRow() {
  List<String> items = ['foo', 'bar', 'foo', 'bar', 'foo'];

  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            height: 35,
            margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 5),
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.all(Radius.circular(10)),
            // ),
            child: Text(
              'Experimental',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            color: Colors.white,
          ),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 5),
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.all(Radius.circular(10)),
            // ),
            child: Text(
              'Fish',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            color: Colors.white,
          ),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 5),
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.all(Radius.circular(10)),
            // ),
            child: Text(
              'Chickenleg',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
