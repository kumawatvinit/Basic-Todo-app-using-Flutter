import 'package:first_one/controller/appdata.dart';
import 'package:flutter/material.dart';
import 'List_page_element.dart';
import 'List_page_fab.dart';
import '../../controller/appdata.dart';
import '../../models/event.dart';

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({Key? key}) : super(key: key);

  @override
  State<TodoHomePage> createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return isLoading
      ? Scaffold(
        body: Center(child: CircularProgressIndicator())
    )
      : Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 100,
          bottom: 10,
        ),
        child: Column(
          children: [
            const Text("Todo List",
            style: TextStyle(
              color: Colors.black,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            ),
            SizedBox(height: 50),
            Expanded(
                child: ListView.builder(
                    itemBuilder: (context, index){
              return TodoListElement(event: Appdata.getevents()[index],
                                      deleteEvent: (){
                                        setState(() {
                                          Appdata.deleteEvent(index);
                                        });
                                      },
              );
            },
                  itemCount: Appdata.getevents().length,
            )
            )

          ]
        )
      ),
          floatingActionButton: ListPageFAB(),
    );
  }
}
