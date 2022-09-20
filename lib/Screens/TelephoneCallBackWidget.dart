import 'package:flutter/material.dart';

class TelephoneCallBackWidget extends StatefulWidget {
  TelephoneCallBackWidget({Key? key, this.informThem}) : super(key: key);

  Function(int)? informThem;
  @override
  State<TelephoneCallBackWidget> createState() =>
      _TelephoneCallBackWidgetState();
}

class _TelephoneCallBackWidgetState extends State<TelephoneCallBackWidget> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Telephone widget"),
          TextButton(
              onPressed: () {
                _count = _count + 1;
                widget.informThem!(_count);
              },
              child: Text("Call"))
        ],
      ),
    );
  }
}
