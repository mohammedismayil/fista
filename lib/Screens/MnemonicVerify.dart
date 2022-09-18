import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';

class MnemonicVerifyScreen extends StatefulWidget {
  const MnemonicVerifyScreen({Key? key}) : super(key: key);

  @override
  State<MnemonicVerifyScreen> createState() => _MnemonicVerifyScreenState();
}

class _MnemonicVerifyScreenState extends State<MnemonicVerifyScreen> {
  bool isCorrect = false;
  String correctOrderString =
      "siren place smooth net stand brush bench unfair potato roof insane stick";
  List originalcorrectOrderList = [
    "siren",
    "place",
    "smooth",
    "net",
    "stand",
    "brush",
    "bench",
    "unfair",
    "potato",
    "roof",
    "insane",
    "stick"
  ];
  List shuffledList = [
    {"value": "stand", "id": 1},
    {"value": "potato", "id": 2},
    {"value": "brush", "id": 3},
    {"value": "unfair", "id": 4},
    {"value": "smooth", "id": 5},
    {"value": "stick", "id": 6},
    {"value": "net", "id": 7},
    {"value": "siren", "id": 8},
    {"value": "roof", "id": 9},
    {"value": "place", "id": 10},
    {"value": "bench", "id": 11},
    {"value": "insane", "id": 12},

  ];

  List givenOrderList = [];

  checkCorrectOrder() {
    List filtered =
        originalcorrectOrderList.take(givenOrderList.length).toList();
    if (listEquals(filtered, givenOrderList)) {
      isCorrect = true;
      setState(() {});
    } else {
      isCorrect = false;
      setState(() {});
    }
  }

  Iterable<Widget> get actorWidgets {
    return givenOrderList.map((actor) {
      return Padding(
          padding: const EdgeInsets.all(4.0),
          child: InkWell(
            onTap: () => {
              givenOrderList.remove(actor),
              shuffledList.add(actor),
              
              shuffledList.sort((a, b){ 
    return a["id"].compareTo(b["id"]);
    //softing on numerical order (Ascending order by Roll No integer)
}),
              checkCorrectOrder(),
            },
            child: Transform(
              transform: new Matrix4.identity()..scale(0.9),
              child: Chip(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: Colors.black)),
                label: Text(
                  actor["value"],
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
          ));
    });
  }

  Iterable<Widget> get getshuffledList {
    return shuffledList.map((actor) {
      return Padding(
          padding: const EdgeInsets.all(4.0),
          child: InkWell(
            onTap: () => {
              shuffledList.remove(actor),
              givenOrderList.add(actor),
                shuffledList.sort((a, b){ 
    return a["id"].compareTo(b["id"]);
    //softing on numerical order (Ascending order by Roll No integer)
}),
              checkCorrectOrder(),
            },
            child: Transform(
              transform: new Matrix4.identity()..scale(0.9),
              child: Chip(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: Colors.black)),
                label: Text(
                  actor["value"],
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Todo list widget building");
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Wrap(
                  children: actorWidgets.toList(),
                ),
              ),
            ],
          ),
          Divider(),
          givenOrderList.length > 0
              ? (isCorrect ? Text("Correct Order") : Text("Invalid order"))
              : SizedBox(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Wrap(
                  children: getshuffledList.toList(),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
