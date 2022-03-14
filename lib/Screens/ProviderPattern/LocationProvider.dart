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
    return Text(

        /// Calls `context.watch` to make [Count] rebuild when [Counter] changes.
        '${context.watch<LocationProvider>().location}',
        key: const Key('locationState'),
        style: Theme.of(context).textTheme.headline6);
  }
}
