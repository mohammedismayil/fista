import 'package:flutterdemo/Screens/TransactionDetailsUpdate/TransactionsProvider.dart';
import 'package:hive/hive.dart';

class HiveHandler {
  Future<double> getBalanceofCoin() async {
    return double.parse(Hive.box('balance').get("eth").toString());
  }

  getBalance() {
    double balance = 0.0;
    getBalanceofCoin().then((value) => balance = value);

    return balance;
  }

  setBalanceOfCoin(String balance) {
    Hive.box('balance').put("eth", balance);
    print("transaction list needs to be updated now");

    TransactionProvider().updateTxs("878hhihi");
  }
}
