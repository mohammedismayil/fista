import 'package:flutter/material.dart';
import 'package:flutterdemo/Screens/TelephoneCallBackWidget.dart';

class CallBackExWidget extends StatefulWidget {
  const CallBackExWidget({Key? key}) : super(key: key);

  @override
  State<CallBackExWidget> createState() => _CallBackExWidgetState();
}

class _CallBackExWidgetState extends State<CallBackExWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("CallBack Example"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TelephoneCallBackWidget(
                    informThem: (p0) {
                      print("from telephone ${p0}");
                    },
                  ),
                ],
              )
            ]),
      ),
    );
  }
}
