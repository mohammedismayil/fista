import 'package:flutter/material.dart';

class StoreDetailView extends StatefulWidget {
  StoreDetailView({Key? key}) : super(key: key);

  @override
  _StoreDetailViewState createState() => _StoreDetailViewState();
}

class _StoreDetailViewState extends State<StoreDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Product count '),
            ElevatedButton(
              onPressed: () {
                // Navigate back to first route when tapped.
              },
              child: Text('Go back!'),
            ),
          ],
        ),
      ),
    );
  }
}
