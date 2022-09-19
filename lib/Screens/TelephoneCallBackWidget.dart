import 'package:flutter/material.dart';

class TelephoneCallBackWidget extends StatefulWidget {
  TelephoneCallBackWidget({Key? key, this.informThem}) : super(key: key);

  Function? informThem;
  @override
  State<TelephoneCallBackWidget> createState() =>
      _TelephoneCallBackWidgetState();
}

class _TelephoneCallBackWidgetState extends State<TelephoneCallBackWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Telephone widget"),
          TextButton(onPressed: () {}, child: Text("Call"))
        ],
      ),
    );
  }
}
