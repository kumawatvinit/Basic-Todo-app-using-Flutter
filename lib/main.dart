import 'package:flutter/material.dart';
import 'Presentation/addtodo/Add_todo_page.dart';
import 'Presentation/ListPage/List_page.dart';
import 'controller/appdata.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Appdata.initEvent();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const TodoHomePage()
    );
  }

}
