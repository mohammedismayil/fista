import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocationProvider with ChangeNotifier {
  String _location = "";

  String get location => _location;
  void setLocation(String givenlocation) {
    _location = givenlocation;
    notifyListeners();
  }
}

class LocationText extends StatelessWidget {
  const LocationText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("building location text widget from provider");
    return Text(

        /// Calls `context.watch` to make [Count] rebuild when [Counter] changes.
        'Current location is ${context.watch<LocationProvider>().location}',
        key: const Key('locationState'),
        style: Theme.of(context).textTheme.headline6);
  }
}
