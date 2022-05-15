import 'package:flutter/material.dart';
import 'package:flutterdemo/Screens/TransactionDetailsUpdate/HiveHandler.dart';
import 'package:provider/provider.dart';

class TransactionProvider with ChangeNotifier {
  int _count = 0;

  String txID = "";

  double balance = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void updateTxs(String id) {
    txID = id;
  }

  double getBalance() {
    return HiveHandler().getBalance();
  }
}
