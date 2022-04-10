import 'dart:convert';
import 'dart:io';
import 'package:meta/meta.dart';

import 'package:http/http.dart' as http;
// import 'package:mvvm_flutter_app/model/apis/app_exception.dart';

class MediaService {
  final String _baseUrl = "https://itunes.apple.com/search?term=";

  Future<dynamic> get(String url) async {
    dynamic responseJson;
    try {
      Uri myUri = Uri.parse(_baseUrl + url);
      final response = await http.get(myUri);
      responseJson = returnResponse(response);
    } on SocketException {
      // throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @visibleForTesting
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
      // throw BadRequestException(response.body.toString());
      case 401:
      case 403:
      // throw UnauthorisedException(response.body.toString());
      case 500:
      default:
      // throw FetchDataException(
      // 'Error occured while communication with server' +
      //     ' with status code : ${response.statusCode}');
    }
  }
}
