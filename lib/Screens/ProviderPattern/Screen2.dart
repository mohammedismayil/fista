import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            Text("Counter count"),
            ElevatedButton(
                onPressed: () {
                  context.read<Counter>().increment();
                },
                child: Text("movetonext"))
          ],
        ),
      )),
    );
  }
}

class Counter with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class Count extends StatelessWidget {
  const Count({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(

        /// Calls `context.watch` to make [Count] rebuild when [Counter] changes.
        '${context.watch<Counter>().count}',
        key: const Key('counterState'),
        style: Theme.of(context).textTheme.headline4);
  }
}
