import 'package:flutterdemo/Screens/TransactionDetailsUpdate/TransactionsProvider.dart';
import 'package:hive/hive.dart';

class HiveHandler {
  double getBalanceofCoin() {
    return double.parse(Hive.box('balance').get("eth").toString());
  }

  getBalance() {
    double balance = 0.0;
    // getBalanceofCoin().then((value) => balance = value);

    return balance;
  }

  setBalanceOfCoin(String balance) async {
   
    Hive.box('balance').put("eth", balance.toString());
    print("transaction list needs to be updated now");
    
  }
}
