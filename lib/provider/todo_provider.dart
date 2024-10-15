import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

class TodoProvider extends ChangeNotifier {
  var todos = [
    Todo(id: 1, title: "first todo"),
  ];
  void addtodo({
    required String title,
  }) {
    var todo = Todo(
      id: todos.isNotEmpty ? todos[todos.length - 1].id + 1 : 1,
      title: title,
    );

    todos.insert(0, todo);

    notifyListeners();
  }

  void toggleTodoDone(int id) {
    final index = todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      todos[index].done = !todos[index].done;
      notifyListeners(); //11. Don't forget to call notifyListeners().
    }
  }
}
