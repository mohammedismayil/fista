import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterdemo/Screens/APIInteractor/AlbumModel.dart';
import 'package:http/http.dart' as http;
import 'package:app_links/app_links.dart';
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
final _navigatorKey = GlobalKey<NavigatorState>();
  late AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;
  void indicateDisabled() {
    print("Nope i am disabled");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDeepLinks();
  }

  void openAppLink(Uri uri) {
    _navigatorKey.currentState?.pushNamed(uri.fragment);
  }

  Future<void> initDeepLinks() async {
    _appLinks = AppLinks();

    // Check initial link if app was in cold state (terminated)
    // final appLink = await _appLinks.getInitialAppLink();
    // if (appLink != null) {
    //   print('getInitialAppLink: $appLink');
    //   openAppLink(appLink);
    // }

    // Handle link when app is in warm state (front or background)
    _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
      print('onAppLink: $uri');
      openAppLink(uri);
    });
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
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Text("Telephone widgettt"),
            TextButton(
                onPressed:
                    widget.isDisabled ? indicateDisabled : incrementCount,
                child: Text("Call"))
          ],
        ),
      ),
    );
  }
}
