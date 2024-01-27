// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_new, must_call_super

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/data/database.dart';
import 'package:todo/util/dialog_box.dart';
import 'package:todo/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the hive box for database
  final _myBox = Hive.box('mybox');
  ToDoDatabase database =
      new ToDoDatabase(); //object of database class to get the default list when app is loaded for very 1st time after installation

  @override
  void initState() {
    //if app is opened for very first time then create the default data
    if (_myBox.get('TODOLIST') == null) {
      database.createInitialData();
    } else {
      //if data already exists load the data
      database.loadDataFromDataBase();
    }
  }

  //text controller
  final _controller = TextEditingController();

  //create check bod change method
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      database.toDoList[index][1] = !database.toDoList[index]
          [1]; //using database list from database.dart file class list
    });
    database
        .updateDataBase(); //calling update hive databse method to store the updation
  }

  //save new task method
  void saveNewTask() {
    setState(() {
      database.toDoList.add([
        _controller.text,
        false
      ]); //using database list from database.dart file class list
      _controller
          .clear(); //to clear text in input field for adding new task after task is added
    });
    Navigator.of(context).pop(); //to remove dialog box after task is added
    database.updateDataBase(); //save a new task and update in database
  }

  //create new task method for button
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          ); //to asl for name of task when creating task using plus button
        });
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      database.toDoList
          .removeAt(index); //to remove the task using its index in the list
    });
    database.updateDataBase(); //save a new task and update in database
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Center(child: Text('TO DO')),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: database.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: database.toDoList[index][0],
            taskCompleted: database.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
