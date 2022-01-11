import 'package:first_one/controller/appdata.dart';
import 'package:first_one/models/event.dart';
import 'package:flutter/material.dart';
import 'package:first_one/models/event.dart';

class TodoListElement extends StatefulWidget {

  const TodoListElement({Key? key,
    required this.event,
    required this.deleteEvent,
  }) : super(key: key);

  final Event event;
  final Function deleteEvent;

  @override
  State<TodoListElement> createState() => _TodoListElementState();
}

class _TodoListElementState extends State<TodoListElement> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        border: Border(
          left: BorderSide(
            color: Colors.black,
            width: 3,
          ),
        ),
      ),
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Checkbox(
              value: widget.event.isCompleted,
              onChanged: (val){
            setState((){
              widget.event.toggleIsCompleted();
              Appdata.saveEvents();
            });
          },
            activeColor: Colors.black,
          ),
          SizedBox(width: 10),

          Text(widget.event.name),

          Spacer(),

          GestureDetector(
            onTap: (){
              print('Delete this task');
              widget.deleteEvent();
              },
            child: Icon(Icons.delete, color: Colors.black)
          ),
        ],
      ),
    );
  }
}
