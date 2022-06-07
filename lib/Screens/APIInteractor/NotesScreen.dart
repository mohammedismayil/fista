import 'package:flutter/material.dart';
import 'package:flutterdemo/Home/HomeHeader.dart';
import 'package:flutterdemo/Screens/APIInteractor/APIInteractor.dart';
import 'package:flutterdemo/Screens/APIInteractor/UsersLocationModel.dart';
import 'package:flutterdemo/Utils/Utility.dart';

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
    interactor.getData(
        "https://run.mocky.io/v3/ae819d6b-298d-41ed-9b2b-8585a8a5c04c",
        {"one": "two"},
        UsersLocationModel);
  }

  @override
  late APIInteractor interactor;

  @override
  onFailure() {
    // TODO: implement onFailure
    throw UnimplementedError();
  }

  T? cast<T>(x) => x is T ? x : null;
  @override
  onSuccess(dynamic response) {
    // TODO: implement onSuccess

    print(response);
    // final List model = response;
    UsersLocationModel? model = UsersLocationModel.fromJson(response);

    print(model.users);
    // final decoded = model.map((item) => UsersLocationModel().fromJson(item));

    // print(decoded);
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
              children: [
                Text("User list"),
                ElevatedButton(
                    onPressed: () {
                      print("show alert");

                      CustomDialog().showMyDialog(context);
                    },
                    child: Text("Show alert")),
                CustomTextBig()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
