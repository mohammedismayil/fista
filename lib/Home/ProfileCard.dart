import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatefulWidget {
  ProfileCard({Key? key}) : super(key: key);

  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    // return ListView(
    //   padding: const EdgeInsets.all(20),
    //   children: <Widget>[
    //     Text(
    //       "Ismayil",
    //       style: TextStyle(
    //         fontWeight: FontWeight.bold,
    //         fontSize: 20,
    //       ),
    //     ),
    //     Card(),
    //     Card(),
    //   ],
    // );
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Card(),
          Card(),
        ],
      ),
    );
  }
}

class Card extends StatelessWidget {
  const Card({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,

              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage("https://picsum.photos/250?image=9"),
              ),

              // color: Colors.red[500],
            ),
            width: 50,
            height: 50,
          ),
        ),
        Text(
          "Ismayil",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Text(
          "Ismayil",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
