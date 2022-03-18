import 'package:flutter/material.dart';
import 'package:flutterdemo/Home/HomeHeader.dart';
import 'package:flutterdemo/Screens/APIInteractor/APIInteractor.dart';
import 'package:flutterdemo/Screens/APIInteractor/UsersLocationModel.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState.withIn(
      interactor: Interactor(view: _NotesScreenState()));
}

class _NotesScreenState extends State<NotesScreen> implements APIView {
  _NotesScreenState.withIn({required this.interactor});

  _NotesScreenState();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // interactor.getData('https://jsonplaceholder.typicode.com/albums/1',
    //     {"one": "two"}, Album());

    getUsersLocation();
  }

  getUsersLocation() {
    interactor.getData("https://jsonplaceholder.typicode.com/users",
        {"one": "two"}, UsersLocationModel());
  }

  @override
  late APIInteractor interactor;

  @override
  onFailure() {
    // TODO: implement onFailure
    throw UnimplementedError();
  }

  @override
  onSuccess(dynamic response) {
    // TODO: implement onSuccess

    print(response);
    // final model = response as Album;

    // print(model.title);
    // throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text("User list")],
            ),
          ),
        ),
      ),
    );
  }
}
