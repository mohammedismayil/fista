import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterdemo/Home/Home.dart';
import 'package:flutterdemo/Home/HomeScreen.dart';
import 'package:flutterdemo/Home/HomeTabbar.dart';
import 'package:flutterdemo/Screens/APIInteractor/NotesScreen.dart';
import 'package:flutterdemo/Screens/DateComparison/DateCompareScreen.dart';
import 'package:flutterdemo/Screens/MVVM/MediaScreen.dart';
import 'package:flutterdemo/Screens/MVVM/MediaVM.dart';
import 'package:flutterdemo/Screens/ProviderPattern/CounterProvider.dart';
import 'package:flutterdemo/Screens/ProviderPattern/LocationProvider.dart';
import 'package:flutterdemo/Screens/ProviderPattern/Screen1.dart';
import 'package:flutterdemo/Screens/ProviderPattern/Screen2.dart';
import 'package:flutterdemo/Screens/QuizApp/QuizScreen.dart';
import 'package:flutterdemo/Screens/TransactionDetailsUpdate/HomeScreen.dart';
import 'package:flutterdemo/Screens/TransactionDetailsUpdate/TransactionsProvider.dart';
import 'package:flutterdemo/WelcomeScreen/WelcomeScreen.dart';
import 'package:hive/hive.dart';

import 'Screens/WishListScreen/WishListScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: MediaViewModel()),
        ChangeNotifierProvider(create: (_) => Counter()),
        ChangeNotifierProvider(create: (_) => TransactionProvider()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: Material(child: HomeScreen()));
  }

  @override
  void initState() {
    // TODO: implement initState
    openBox();
    super.initState();
  }

  openBox() async {
    var path = Directory.current.path;
    Hive.init(path);

    // await Hive.openBox('balance');
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Alert Dialog Box"),
          content: Text("You have raised a Alert Dialog Box"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                print("okay tapped");
                Navigator.of(ctx).pop();
              },
              child: Text("okay"),
            ),
          ],
        ),
      );
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
