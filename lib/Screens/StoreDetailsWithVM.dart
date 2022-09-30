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
  int count = 0;
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

              Text("Count $count"),
              TextButton(
                  onPressed: () {
                    count += 1;
                    print(count);
                  },
                  child: Text("Button 1")),

               TextButton(
                  onPressed: () {
                  
setState(() {
  
});

                
                  },
                  child: Text("Button 2")),
              Text(details?.name ?? ""),
            ]),
      ),
    );
  }
}
