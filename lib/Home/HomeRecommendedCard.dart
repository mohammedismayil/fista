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
        width: 270,
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(10),
        //   color: AppTheme().themeYellow,
        // ),
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
              padding: const EdgeInsets.only(top: 10,bottom: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [Text("Heaven's Park",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                      
                      
                      )],
                    ),
                  ),
                  Row(
                   
                    children: [
                      RatingRow(),
                      SizedBox(width: 15),
                      timeRow(),
                      SizedBox(width: 15),
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
      SizedBox(width: 5),
      Text("4.5")
    ],
  );
}

Widget timeRow() {
  return Row(
    children: [Icon(Icons.access_time_sharp, size: 15),
    SizedBox(width: 5), Text("25-30min")],
  );
}

Widget starRow() {
  return Row(
    children: [Text('\$\$\$\$')],
  );
}

Widget storeCategoryRow() {
  return Padding(
    padding: const EdgeInsets.only(top:20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(right: 20, left: 20),
          child: Text('Fish',textAlign: TextAlign.center,),
          color: Colors.white,
        ),
        Container(
          margin: EdgeInsets.only(right: 20, left: 20),
         child: Text('Fish',textAlign: TextAlign.center,),
          color: Colors.white,
        ),
        Container(
          margin: EdgeInsets.only(right: 20, left: 20),
          child: Expanded(
            child: Flexible(child: Text('Experimental',textAlign: TextAlign.center, maxLines: 1,
                    softWrap: false,)),
          ),
          color: Colors.white,
        ),
      ],
    ),
  );
}
