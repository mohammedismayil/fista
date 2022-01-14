import 'package:flutter/material.dart';
import 'package:flutterdemo/Constants/ThemeColors.dart';

class HomeCategoryCard extends StatefulWidget {
  const HomeCategoryCard({Key? key}) : super(key: key);

  @override
  _HomeCategoryCardState createState() => _HomeCategoryCardState();
}

class _HomeCategoryCardState extends State<HomeCategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 150,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppTheme().themeYellow,
        ),
        child: Column(
          children: [
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
          ],
        ),
      ),
    );
  }
}
