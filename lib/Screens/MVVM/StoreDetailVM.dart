import 'package:flutter/material.dart';
import 'package:flutterdemo/Screens/MVVM/MediaModel.dart';
import 'package:flutterdemo/Screens/StoreDetailModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StoreDetailViewModel with ChangeNotifier {
  RestaurantDetails? _details;
  late Future<Welcome> futureAlbum;
  StoreDetailViewModel() {
    fetchAlbum().then(
        (value) => {_details = value.restaurantDetails, notifyListeners()});
  }

  RestaurantDetails? get details {
    return _details;
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
}
