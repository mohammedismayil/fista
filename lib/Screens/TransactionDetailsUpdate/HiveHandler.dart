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

  setBalanceOfCoin(String balance) {
    double bal = double.parse(Hive.box('balance').get("eth").toString()) + 1.0;
    Hive.box('balance').put("eth", bal.toString());
    print("transaction list needs to be updated now");
    TransactionProvider provider = TransactionProvider();
    provider.changeBalance(bal);
  }
}
