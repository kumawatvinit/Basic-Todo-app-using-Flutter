import 'package:flutter/material.dart';
import '../addtodo/Add_todo_page.dart';

class ListPageFAB extends StatelessWidget {
  const ListPageFAB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: (){
          print("Go to Add Todo page");
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => const AddTodoPage(),
            )
          );
        },
      backgroundColor: Colors.black,
      child: Icon(Icons.add,
      color: Colors.white,
      ),

        );
  }
}
