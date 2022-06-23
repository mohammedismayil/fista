import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List todos = ["wake", "brush", "eat", "code", "sleep"];

  getBookCount() {
    if (Hive.box("booklist").isNotEmpty) {
      if (Hive.box("booklist").getAt(0) != null) {
        return Hive.box("booklist").values.length.toString();
      } else {
        return "";
      }
    } else {
      return "";
    }
  }

  addBookInHive() {
    // setState(() {
      Hive.box("booklist").add("Davincicode");
    // });
  }

  addToLocalArray() {
    setState(() {
      todos.add("mehrezeyaa");
      Hive.box("booklist");
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Todo list widget building");
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        addBookInHive();
                      },
                      child: Text("Add to hive")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        addToLocalArray();
                      },
                      child: Text("Add to array")),
                )
              ],
            ),
            Text(getBookCount()),
            ValueListenableBuilder(
              valueListenable: Hive.box("booklist").listenable(),
              builder: (context, value, child) {
                print("Value listenable builder building now");
                return SingleChildScrollView(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(todos[index]),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
