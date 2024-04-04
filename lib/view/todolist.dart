import 'package:flutter/material.dart';
import 'package:to_do/controller/todocontroller.dart';

class ToDoList extends StatefulWidget {
  ToDoList({super.key, required this.todoitem, this.onDelete});

  final todoitem;
  final void Function()? onDelete;
  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              TodoController.getdata(widget.todoitem)!.taskNmae.toString(),
              style: isChecked == false
                  ? TextStyle(color: Colors.black, fontSize: 20)
                  : TextStyle(
                      color: Colors.green,
                      decoration: TextDecoration.lineThrough,
                      fontSize: 20),
            ),
          ),isChecked == false
              ? Icon(
                  Icons.close,
                  color: Colors.red,
                  size: 18,
                )
              : Icon(
                  Icons.verified,
                  color: Colors.blue,
                  size: 18,
                ),
          IconButton(onPressed: widget.onDelete, icon: Icon(Icons.delete,
          color: Colors.redAccent,))
        ],
      ),
    );
  }
}