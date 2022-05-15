import 'package:flutter/material.dart';
import 'package:flutterdemo/Screens/ProviderPattern/CounterProvider.dart';
import 'package:flutterdemo/Screens/TransactionDetailsUpdate/HiveHandler.dart';
import 'package:flutterdemo/Screens/TransactionDetailsUpdate/TransactionsProvider.dart';
import 'package:hive/hive.dart';
import 'package:provider/src/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Home")),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {}, child: Text("Time1")),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [Text("${timeOne.toString()}")],
            // ),

            Text('ihi')
          ],
        ),
      )),
    );
  }

  openBox() async {
    await Hive.openBox('balance');
  }

  @override
  void initState() {
    // TODO: implement initState

    openBox();

    // HiveHandler().setBalanceOfCoin("90");
    super.initState();
  }
}
