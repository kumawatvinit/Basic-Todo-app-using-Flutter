import 'package:flutter/material.dart';
import '../ListPage/List_page.dart';
import '../../controller/appdata.dart';
import '../../models/event.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({Key? key}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  String eventName = "";

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {


    //<condn> ? ValueA: Value;

    return Scaffold(
      body: isLoading ?
      Center(child: CircularProgressIndicator()):
      Padding(
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: 30,
          top: 100,
        ),
        child: Column(
          children: [
            const Text("Add Todo",
            style: TextStyle(
              color: Colors.black,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            ),

            SizedBox(height: 50),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter name of todo",
                ),
                onChanged: (str){
                  setState(() {
                    eventName = str;
                  });
                },
              )
            )
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if(eventName != "") {

            setState(() {
              isLoading = true;
            });
            await Appdata.addEvent(Event(name: eventName));

            setState(() {
              isLoading = false;
            });

            // await Future.delayed(Duration(milliseconds: 50));

            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => const TodoHomePage(),
              ),
            );
          }
        },
        backgroundColor: Colors.black,
        child: Icon(
          Icons.save,
          color: Colors.white,
        ),
      ),
    );
  }
}
