import 'package:flutter/material.dart';

class StoreDetailScreen extends StatefulWidget {
  const StoreDetailScreen({Key? key}) : super(key: key);

  @override
  _StoreDetailScreenState createState() => _StoreDetailScreenState();
}

class _StoreDetailScreenState extends State<StoreDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Column(
          children: [
            Stack(children: [
              Container(
                // width: 270,
                // padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(5),
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  image: DecorationImage(
                    image: AssetImage("assets/images/pizza.jpeg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                // width: 270,
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                // color: Colors.purple,
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Icon(Icons.arrow_back),
                      ),
                      onTap: () => {Navigator.pop(context)},
                    ),
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Icon(Icons.shopping_basket),
                    ),
                  ],
                ),
              ),
            ]),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 250,
                  child: Text(
                    "Grilled cheese salad with ice cream",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Container(
                  width: 100,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      Text("1"),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
