import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterdemo/Screens/APIInteractor/AlbumModel.dart';
import 'package:http/http.dart' as http;

typedef SimpleCallBack = Function(int);

abstract class DisablingButton {
  bool isDisabled = false;
}

class TelephoneCallBackWidget extends StatefulWidget
    implements DisablingButton {
  TelephoneCallBackWidget({Key? key, this.informThem}) : super(key: key);

  SimpleCallBack? informThem;
  @override
  State<TelephoneCallBackWidget> createState() =>
      _TelephoneCallBackWidgetState();

  @override
  bool isDisabled = false;
}

class _TelephoneCallBackWidgetState extends State<TelephoneCallBackWidget> {
  int _count = 0;

  void indicateDisabled() {
    print("Nope i am disabled");
  }

  void incrementCount() async {
    setState(() {
      widget.isDisabled = true;
    });

    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      _count = _count + 1;
      widget.informThem!(_count);
      widget.isDisabled = false;
      setState(() {});
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Telephone widget"),
          TextButton(
              onPressed: widget.isDisabled ? indicateDisabled : incrementCount,
              child: Text("Call"))
        ],
      ),
    );
  }
}
