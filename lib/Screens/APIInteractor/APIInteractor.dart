import 'dart:convert';

import 'package:flutterdemo/Screens/APIInteractor/AlbumModel.dart';
import 'package:http/http.dart' as http;

abstract class APIInteractor {
  late APIView view;
  APIInteractor({
    required this.view,
  });

  getData(String api) {}
}

abstract class APIView {
  late APIInteractor interactor;

  onSuccess(dynamic response);
  onFailure();
}

class View extends APIView {
  @override
  // TODO: implement interactor
  APIInteractor get interactor => super.interactor;
  @override
  onFailure() {
    // TODO: implement onFailure
    throw UnimplementedError();
  }

  View();
  @override
  onSuccess(dynamic response) {
    // TODO: implement onSuccess
    throw UnimplementedError();
  }
}

class Interactor implements APIInteractor {
  late APIView view;

  Interactor({
    required this.view,
  });

  @override
  onFailure() {
    // TODO: implement onFailure
    throw UnimplementedError();
  }

  @override
  onSuccess(dynamic response) {
    // TODO: implement onSuccess
    throw UnimplementedError();
  }

  @override
  getData(String api) async {
    // TODO: implement getData
    print("coming to getdata");
    final response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      view.onSuccess(Album.fromJson(jsonDecode(response.body)));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
