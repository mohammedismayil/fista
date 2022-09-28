import 'package:flutter/material.dart';
import 'package:flutterdemo/Screens/MVVM/StoreDetailVM.dart';
import 'package:flutterdemo/Screens/StoreDetailModel.dart';
import 'package:provider/provider.dart';

class StoreDetailsWithVM extends StatefulWidget {
  const StoreDetailsWithVM({Key? key}) : super(key: key);

  @override
  State<StoreDetailsWithVM> createState() => _StoreDetailsWithVMState();
}

class _StoreDetailsWithVMState extends State<StoreDetailsWithVM> {
  @override
  Widget build(BuildContext context) {
    RestaurantDetails? details =
        Provider.of<StoreDetailViewModel>(context).details;
    return Scaffold(
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("CallBack Example"),
              Text(details?.name ?? ""),
            ]),
      ),
    );
  }
}
