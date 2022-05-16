import 'package:flutter/material.dart';
import 'package:flutterdemo/Screens/TransactionDetailsUpdate/HiveHandler.dart';
import 'package:provider/provider.dart';

class TransactionProvider with ChangeNotifier {
  int _count = 0;

  String txID = "";

  double _balance = HiveHandler().getBalanceofCoin();
  double get balance => _balance;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void updateTxs(String id) {
    txID = id;
  }

  double getBalance() {
    // balance = HiveHandler().getBalanceofCoin();
    return balance;
  }

  changeBalance(double givenBalance) {
    _balance = givenBalance;
    notifyListeners();
  }
}
