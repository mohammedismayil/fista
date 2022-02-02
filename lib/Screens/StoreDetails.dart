import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutterdemo/Constants/ThemeColors.dart';
import 'package:flutterdemo/Home/HomeRestaurantCard.dart';

import 'StoreDetailModel.dart';

class StoreDetailScreen extends StatefulWidget {
  const StoreDetailScreen({Key? key}) : super(key: key);

  @override
  _StoreDetailScreenState createState() => _StoreDetailScreenState();
}

class _StoreDetailScreenState extends State<StoreDetailScreen> {
  int cartItemscount = 1;
  late Future<Welcome> futureAlbum;

  late Welcome modelData;
  Widget RatingRow() {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 15,
          color: AppTheme().themeYellow,
        ),
        SizedBox(width: 2),
        Text(
          "4.7 Ratings",
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }

  Widget locationRow() {
    return Row(
      children: [
        Icon(
          Icons.location_on,
          size: 15,
          color: AppTheme().themeYellow,
        ),
        SizedBox(width: 2),
        Text(
          "2.3 KM",
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }

  Widget preparationTimeRow() {
    return Row(
      children: [
        Icon(
          Icons.fastfood,
          size: 15,
          color: AppTheme().themeYellow,
        ),
        SizedBox(width: 2),
        Text(
          "20-24 Mins",
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }

  Future<Welcome> fetchAlbum() async {
    final response = await http.get(Uri.parse(
        'https://run.mocky.io/v3/b6f09c90-5162-4ee8-988b-90f0a1f84dd0'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(response.body);
      return Welcome.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: FutureBuilder(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              modelData = snapshot.data as Welcome;
              return Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(url: modelData.restaurantDetails.image),
                  NameAndAddButtons(),
                  RatingAndDetails(),
                  Description(
                      description: modelData.restaurantDetails.description),
                  Expanded(
                    child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                child: Container(
                                    width: 150,
                                    height: 50,
                                    margin:
                                        EdgeInsets.only(right: 10, left: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)),
                                        border: Border.all(
                                            color: AppTheme().themeYellow)),
                                    child: Center(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 15,
                                          color: AppTheme().themeYellow,
                                        ),
                                        Text(
                                          "Chat",
                                          style: TextStyle(
                                              color: AppTheme().themeYellow,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ))),
                              ),
                              InkWell(
                                child: Container(
                                    width: 150,
                                    height: 50,
                                    margin:
                                        EdgeInsets.only(right: 10, left: 10),
                                    decoration: BoxDecoration(
                                      color: AppTheme().themeYellow,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Add cart",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    )),
                              )
                            ],
                          ),
                        )),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      )),
    );
  }

  Padding NameAndAddButtons() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 230,
            child: Text(
              "Grilled cheese salad with ice cream",
              style: TextStyle(fontSize: 25),
            ),
          ),
          Container(
            width: 100,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  onTap: () => {
                    if (cartItemscount != 1)
                      {
                        setState(() {
                          cartItemscount = cartItemscount - 1;
                        })
                      }
                  },
                ),
                Text("$cartItemscount"),
                InkWell(
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  onTap: () => {
                    setState(() {
                      cartItemscount = cartItemscount + 1;
                    })
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container RatingAndDetails() {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          locationRow(),
          SizedBox(width: 15),
          RatingRow(),
          SizedBox(width: 15),
          preparationTimeRow(),
        ],
      ),
    );
  }
}

class Description extends StatelessWidget {
  final description;
  const Description({
    Key? key,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Description",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text:
                                description,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                wordSpacing: 5,
                                height: 1.5)),
                        TextSpan(
                            text: 'Read more...',
                            style: TextStyle(fontSize: 15, color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('Terms of Service"');
                              }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Image extends StatelessWidget {
  final url;
  const Image({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        // width: 270,
        // padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(5),
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          image: DecorationImage(
            image: NetworkImage(url),
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
    ]);
  }
}



                            // "Originating from cyprus,semisoft and slightly nutty halloumi cheese resists melting when heated , so you can luxuriate , Read more",
                            // style: TextStyle(fontSize: 15, color: Colors.grey),