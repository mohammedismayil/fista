import 'package:flutter/material.dart';

class DateComparisonScreen extends StatefulWidget {
  const DateComparisonScreen({Key? key}) : super(key: key);

  @override
  State<DateComparisonScreen> createState() => _DateComparisonScreenState();
}

class _DateComparisonScreenState extends State<DateComparisonScreen> {
  late DateTime timeOne;
  late DateTime timeTwo;

  String intervalInseconds = "";
  setTimeOne() {
    setState(() {
      timeOne = DateTime.now();
      print(timeOne);
    });
  }

  setTimeTwo() {
    setState(() {
      timeTwo = DateTime.now();
      print(timeTwo);
    });
  }

  calculateInterval() {
    setState(() {
      intervalInseconds = timeTwo.difference(timeOne).inSeconds.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz App"),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  setTimeOne();
                },
                child: Text("Time1")),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [Text("${timeOne.toString()}")],
            // ),
            ElevatedButton(
                onPressed: () {
                  setTimeTwo();
                },
                child: Text("Time2")),
            ElevatedButton(
                onPressed: () {
                  calculateInterval();
                },
                child: Text("Get Interval")),
            Text("Difference between two times is $intervalInseconds")
          ],
        ),
      )),
    );
  }
}
