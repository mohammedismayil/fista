import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/Home/HomeHeader.dart';
import 'package:flutterdemo/Home/HomeRestaurantCard.dart';

import 'ProfileCard.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final Future<Welcome> futureRestaurant;

  @override
  void initState() {
    super.initState();
    print("heheh");
    futureRestaurant = fetchRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Column(
            children: [
              // #6b64e0

              Container(
                 
                  child: HomeHeader()),
                 Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text("Categories",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 25)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Row(
                      children: [
                        Image(
                            image: NetworkImage(
                                "https://img.icons8.com/material-outlined/2x/appointment-reminders.png"),
                            height: 25,
                            width: 25),
                        Image(
                            image: NetworkImage(
                                "https://img.icons8.com/material-outlined/2x/appointment-reminders.png"),
                            height: 25,
                            width: 25),
                      ],
                    ),
                  ),
                ],
              ),
              restaurantsView()
            ],
          ),
          // ProfileCard(),
        ],
      ),
    );
  }

  Container restaurantsView() {
    return Container(
        height: 500,
        child: FutureBuilder<Welcome>(
          future: fetchRestaurants(), // function where you call your api
          builder: (BuildContext context, AsyncSnapshot<Welcome> snapshot) {
            // AsyncSnapshot<Your object type>
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: Text('Please wait its loading...'));
            } else {
              if (snapshot.hasError)
                return Center(child: Text('Error: ${snapshot.error}'));
              else
                // return Center(
                //     child: new HomeRestaurantCard(
                //   '${snapshot.data!.restaurant}',
                //   restaurant: snapshot.data!.restaurant[0],
                // ));

                return ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: snapshot.data!.restaurant.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return HomeRestaurantCard(
                        '${snapshot.data!.restaurant}',
                        restaurant: snapshot.data!.restaurant[index],
                      );
                    }); // snapshot.data  :- get your object which is pass from your downloadData() function
            }
          },
        ));
  }

  Future<Welcome> fetchRestaurants() async {
    final response = await http.get(Uri.parse(
        'https://run.mocky.io/v3/a4c07483-67e4-414f-ac0c-d98d752414af'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      print(Welcome.fromJson(jsonDecode(response.body)));
      return Welcome.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
