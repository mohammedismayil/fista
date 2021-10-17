import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutterdemo/Home/HomeRestaurantCard.dart';

import 'ProfileCard.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;



class HomeHeader extends StatefulWidget {
  HomeHeader({Key? key}) : super(key: key);

  @override
  _HomeHeaderState createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  late final Future<Welcome> futureRestaurant;

  @override
  void initState() {
    super.initState();
    print("heheh");
    futureRestaurant = fetchRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        categoryview(),
        Text("Hello Ismayil"),
        restaurantsView(),
        Text("Welcome Back"),
        Text("Hello Ismayil"),
      ],
    );
  }

  SizedBox categoryview() {
    return SizedBox(
      height: 75,
      child: ListView(
        padding: const EdgeInsets.all(8),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Card(),
          Card(),
          Card(),
          Card(),
        ],
      ),
    );
  }

  SizedBox restaurantsView() {
    return SizedBox(
        height: 215,
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
                    itemCount: snapshot.data!.restaurant.length,
                    scrollDirection: Axis.horizontal,
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

class Album {
  final int userId;
  final int id;
  final String title;

  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
