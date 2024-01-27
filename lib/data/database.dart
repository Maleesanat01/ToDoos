import 'package:hive/hive.dart';

class ToDoDatabase {
  //list to do list
  List toDoList = [];
  //reference box
  final _myBox = Hive.box('mybox');

  //method to create initial data run if app is opened for very 1st time
  void createInitialData() {
    toDoList = [
      ["Make Tutorial", false],
      ["Do Exercise", false],
    ];
  }

  //methos to load data from the database
  void loadDataFromDataBase() {
    toDoList = _myBox.get(
        "TODOLIST"); //returns todo list from database, the 'TODOLIST' is a key that will return the todo list
  }

  //update database method
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList); //updates the todo list
  }
}
