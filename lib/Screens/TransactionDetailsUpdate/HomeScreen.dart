import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterdemo/Screens/ProviderPattern/CounterProvider.dart';
import 'package:flutterdemo/Screens/TransactionDetailsUpdate/HiveHandler.dart';
import 'package:flutterdemo/Screens/TransactionDetailsUpdate/TransactionsProvider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/src/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  changeBalance() {
    HiveHandler().setBalanceOfCoin("7.9");
  }

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
            ElevatedButton(
                onPressed: () {
                  changeBalance();
                },
                child: Text("Time1")),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [Text("${timeOne.toString()}")],
            // ),

            Text('${context.watch<TransactionProvider>().balance}')
          ],
        ),
      )),
    );
  }

  openBox() async {
    Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

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
